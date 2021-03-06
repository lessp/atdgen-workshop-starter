open Express;

let dirname =
  switch ([%bs.node __dirname]) {
  | Some(d) => d
  | None => Js.Exn.raiseError("Could not get __dirname")
  };

let getRefdomainsJson = () => {
  switch (
    Node.Path.join([|dirname, "refdomains.json"|])
    ->Node.Fs.readFileAsUtf8Sync
    ->Js.Json.parseExn
    ->Refdomains_bs.read_main
  ) {
  | exception _ => Belt.Result.Error("Failed to parse JSON")
  | result => Belt.Result.Ok(result)
  };
};

let app = express();

App.disable(app, ~name="x-powered-by");

App.useOnPath(
  app,
  ~path="/",
  {
    Static.defaultOptions() |> Static.make(".") |> Static.asMiddleware;
  },
);

App.get(app, ~path="/refdomains") @@
Middleware.from((_next, _req) =>
  switch (getRefdomainsJson()) {
  | Belt.Result.Ok(s) => s->Refdomains_bs.write_main |> Response.sendJson
  | _ => Response.sendStatus(BadRequest)
  }
);

let onListen = err =>
  switch (err) {
  | exception (Js.Exn.Error(exn)) =>
    Js.log(exn);
    Node.Process.exit(1);
  | _ => Js.log @@ "Listening at http://localhost:8000"
  };

let server = App.listen(app, ~port=8000, ~onListen, ());
