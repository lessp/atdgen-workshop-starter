(* Auto-generated from "refdomains.atd" *)
              [@@@ocaml.warning "-27-32-35-39"]

type t = Refdomains_t.t = {
  refdomain: string;
  backlinks: int;
  refpages: int;
  firstSeen (*atd first_seen *): string;
  lastVisited (*atd last_visited *): Js.Date.t;
  domainRating (*atd domain_rating *): DomainRating.t
}

type stats = Refdomains_t.stats = { refdomains: int; ips: int; class_c: int }

type main = Refdomains_t.main = {
  refDomains (*atd refdomains *): t list;
  stats: stats
}

let write__2 = (
    Atdgen_codec_runtime.Encode.int
  |> Atdgen_codec_runtime.Encode.contramap (DomainRating.unwrap)
)
let read__2 = (
  (
    Atdgen_codec_runtime.Decode.int
  ) |> (Atdgen_codec_runtime.Decode.map (DomainRating.wrap))
)
let write__1 = (
    Atdgen_codec_runtime.Encode.string
  |> Atdgen_codec_runtime.Encode.contramap (Js.Date.toISOString)
)
let read__1 = (
  (
    Atdgen_codec_runtime.Decode.string
  ) |> (Atdgen_codec_runtime.Decode.map (Js.Date.fromString))
)
let write_t = (
  Atdgen_codec_runtime.Encode.make (fun (t : t) ->
    (
    Atdgen_codec_runtime.Encode.obj
      [
          Atdgen_codec_runtime.Encode.field
            (
            Atdgen_codec_runtime.Encode.string
            )
          ~name:"refdomain"
          t.refdomain
        ;
          Atdgen_codec_runtime.Encode.field
            (
            Atdgen_codec_runtime.Encode.int
            )
          ~name:"backlinks"
          t.backlinks
        ;
          Atdgen_codec_runtime.Encode.field
            (
            Atdgen_codec_runtime.Encode.int
            )
          ~name:"refpages"
          t.refpages
        ;
          Atdgen_codec_runtime.Encode.field
            (
            Atdgen_codec_runtime.Encode.string
            )
          ~name:"first_seen"
          t.firstSeen
        ;
          Atdgen_codec_runtime.Encode.field
            (
            write__1
            )
          ~name:"last_visited"
          t.lastVisited
        ;
          Atdgen_codec_runtime.Encode.field
            (
            write__2
            )
          ~name:"domain_rating"
          t.domainRating
      ]
    )
  )
)
let read_t = (
  Atdgen_codec_runtime.Decode.make (fun json ->
    (
      ({
          refdomain =
            Atdgen_codec_runtime.Decode.decode
            (
              Atdgen_codec_runtime.Decode.string
              |> Atdgen_codec_runtime.Decode.field "refdomain"
            ) json;
          backlinks =
            Atdgen_codec_runtime.Decode.decode
            (
              Atdgen_codec_runtime.Decode.int
              |> Atdgen_codec_runtime.Decode.field "backlinks"
            ) json;
          refpages =
            Atdgen_codec_runtime.Decode.decode
            (
              Atdgen_codec_runtime.Decode.int
              |> Atdgen_codec_runtime.Decode.field "refpages"
            ) json;
          firstSeen =
            Atdgen_codec_runtime.Decode.decode
            (
              Atdgen_codec_runtime.Decode.string
              |> Atdgen_codec_runtime.Decode.field "first_seen"
            ) json;
          lastVisited =
            Atdgen_codec_runtime.Decode.decode
            (
              read__1
              |> Atdgen_codec_runtime.Decode.field "last_visited"
            ) json;
          domainRating =
            Atdgen_codec_runtime.Decode.decode
            (
              read__2
              |> Atdgen_codec_runtime.Decode.field "domain_rating"
            ) json;
      } : t)
    )
  )
)
let write_stats = (
  Atdgen_codec_runtime.Encode.make (fun (t : stats) ->
    (
    Atdgen_codec_runtime.Encode.obj
      [
          Atdgen_codec_runtime.Encode.field
            (
            Atdgen_codec_runtime.Encode.int
            )
          ~name:"refdomains"
          t.refdomains
        ;
          Atdgen_codec_runtime.Encode.field
            (
            Atdgen_codec_runtime.Encode.int
            )
          ~name:"ips"
          t.ips
        ;
          Atdgen_codec_runtime.Encode.field
            (
            Atdgen_codec_runtime.Encode.int
            )
          ~name:"class_c"
          t.class_c
      ]
    )
  )
)
let read_stats = (
  Atdgen_codec_runtime.Decode.make (fun json ->
    (
      ({
          refdomains =
            Atdgen_codec_runtime.Decode.decode
            (
              Atdgen_codec_runtime.Decode.int
              |> Atdgen_codec_runtime.Decode.field "refdomains"
            ) json;
          ips =
            Atdgen_codec_runtime.Decode.decode
            (
              Atdgen_codec_runtime.Decode.int
              |> Atdgen_codec_runtime.Decode.field "ips"
            ) json;
          class_c =
            Atdgen_codec_runtime.Decode.decode
            (
              Atdgen_codec_runtime.Decode.int
              |> Atdgen_codec_runtime.Decode.field "class_c"
            ) json;
      } : stats)
    )
  )
)
let write__3 = (
  Atdgen_codec_runtime.Encode.list (
    write_t
  )
)
let read__3 = (
  Atdgen_codec_runtime.Decode.list (
    read_t
  )
)
let write_main = (
  Atdgen_codec_runtime.Encode.make (fun (t : main) ->
    (
    Atdgen_codec_runtime.Encode.obj
      [
          Atdgen_codec_runtime.Encode.field
            (
            write__3
            )
          ~name:"refdomains"
          t.refDomains
        ;
          Atdgen_codec_runtime.Encode.field
            (
            write_stats
            )
          ~name:"stats"
          t.stats
      ]
    )
  )
)
let read_main = (
  Atdgen_codec_runtime.Decode.make (fun json ->
    (
      ({
          refDomains =
            Atdgen_codec_runtime.Decode.decode
            (
              read__3
              |> Atdgen_codec_runtime.Decode.field "refdomains"
            ) json;
          stats =
            Atdgen_codec_runtime.Decode.decode
            (
              read_stats
              |> Atdgen_codec_runtime.Decode.field "stats"
            ) json;
      } : main)
    )
  )
)
