type t =
  | Average(int)
  | Good(int)
  | Poor(int);

let wrap = n =>
  switch (n) {
  | n when n < 33 => Poor(n)
  | n when n < 66 => Average(n)
  | n => Good(n)
  };

let unwrap = r =>
  switch (r) {
  | Average(n)
  | Good(n)
  | Poor(n) => n
  };
