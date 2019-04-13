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

val read_t :  t Atdgen_codec_runtime.Decode.t

val write_t :  t Atdgen_codec_runtime.Encode.t

val read_stats :  stats Atdgen_codec_runtime.Decode.t

val write_stats :  stats Atdgen_codec_runtime.Encode.t

val read_main :  main Atdgen_codec_runtime.Decode.t

val write_main :  main Atdgen_codec_runtime.Encode.t

