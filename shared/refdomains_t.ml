(* Auto-generated from "refdomains.atd" *)
              [@@@ocaml.warning "-27-32-35-39"]

type t = {
  refdomain: string;
  backlinks: int;
  refpages: int;
  firstSeen (*atd first_seen *): string;
  lastVisited (*atd last_visited *): Js.Date.t;
  domainRating (*atd domain_rating *): DomainRating.t
}

type stats = { refdomains: int; ips: int; class_c: int }

type main = { refDomains (*atd refdomains *): t list; stats: stats }
