// Each refDomain object stored in the array of refdomains.json
type t = {
  refdomain: string, // The referring domain that contains at least one link to the target.
  backlinks: int, // Number of backlinks found in the referring domain that link to the target.
  refpages: int, // Number of referring pages found in the referring domain that link to the target.
  firstSeen: string, // Least recent date when the Ahrefs crawler was able to visit the backlinks in the referring domain.
  lastVisited: string, // Most recent date when the Ahrefs crawler was able to visit the backlinks in the referring domain.
  domainRating: int // Domain Rating of the referring domain.
};

// The main type that represents the object stored in refdomains.json
type main = {refDomains: array(t)};

// Encoders

let encodeOne: t => Js.Json.t =
  r =>
    Json.Encode.object_([
      ("refdomain", Json.Encode.string(r.refdomain)),
      ("backlinks", Json.Encode.int(r.backlinks)),
      ("refpages", Json.Encode.int(r.refpages)),
      ("first_seen", Json.Encode.string(r.firstSeen)),
      ("last_visited", Json.Encode.string(r.lastVisited)),
      ("domain_rating", Json.Encode.int(r.domainRating)),
    ]);

let encodeArray: array(t) => Js.Json.t =
  arr => arr |> Json.Encode.array(encodeOne); // <---- Implement

let encodeMain = main =>
  Json.Encode.(object_([("refdomains", encodeArray(main.refDomains))]));

// Decoders

let decodeOne: Js.Json.t => t =
  json =>
    Json.Decode.{
      refdomain: json |> field("refdomain", string),
      backlinks: json |> field("backlinks", int),
      refpages: json |> field("refpages", int),
      firstSeen: json |> field("first_seen", string),
      lastVisited: json |> field("last_visited", string),
      domainRating: json |> field("domain_rating", int),
    }; // <---- Implement

let decodeArray: Js.Json.t => array(t) =
  json => json |> Json.Decode.array(decodeOne); // <---- Implement

let decodeMain = json =>
  Json.Decode.{refDomains: json |> field("refdomains", decodeArray)};
