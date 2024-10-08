open Base
open Stdio

type letter =
  { c: char
  ; l1: char array
  ; l2: char array
  ; l3: char array
  ; l4: char array
  ; l5: char array
  } [@@deriving sexp]

let make_letter c l1 l2 l3 l4 l5 =
  let l1 = String.to_array l1 in
  let l2 = String.to_array l2 in
  let l3 = String.to_array l3 in
  let l4 = String.to_array l4 in
  let l5 = String.to_array l5 in
  { c; l1; l2; l3; l4; l5 }

let create_alphabet () =
  let alph = Hashtbl.create (module Char) in
  Hashtbl.add_exn alph ~key:'0' ~data:(make_letter '0' ",===." "#   #" "#   #" "#   #" "`==='");
  Hashtbl.add_exn alph ~key:'1' ~data:(make_letter '1' "   a " "  A# " " ' # " "  ,# " ".===.");
  Hashtbl.add_exn alph ~key:'2' ~data:(make_letter '2' ",===." "^  .#" "  // " " //  " "<===.");
  Hashtbl.add_exn alph ~key:'3' ~data:(make_letter '3' ",===." "^  ,#" "  <= " ".  `#" "`==='");
  Hashtbl.add_exn alph ~key:'4' ~data:(make_letter '4' "   A " "  /# " " /## " "'--#-" ".==#.");
  Hashtbl.add_exn alph ~key:'5' ~data:(make_letter '5' ",====" "#'   " "`===." "n   #" "`==='");
  Hashtbl.add_exn alph ~key:'6' ~data:(make_letter '6' ",====" "#'   " "#.==." "#   #" "`==='");
  Hashtbl.add_exn alph ~key:'7' ~data:(make_letter '7' "<===o" "  // " " //  " " ||  " ".a#.  ");
  Hashtbl.add_exn alph ~key:'8' ~data:(make_letter '8' ",===." "#   #" "#>=<#" "#   #" "`==='");
  Hashtbl.add_exn alph ~key:'9' ~data:(make_letter '9' ",===." "#  .#" "`===#" "    #" "`==='");
  Hashtbl.add_exn alph ~key:':' ~data:(make_letter ':' "     " "  O  " "     " "  O  " "     ");
  Hashtbl.add_exn alph ~key:' ' ~data:(make_letter ' ' "     " "     " "     " "     " "     ");
  alph

let print_with_offset ~offset:(n: int) l =
  let open Out_channel in
  let open Csi in
  let up ?(chars=0) lines = 
    printf "%s%s"  (cuu lines) (cha @@ chars + n) ;
  in
  printf "%s" (scp ());
  Array.iteri l.l1  ~f:(fun i c -> printf "%s" (rcp ()); up ~chars:i 5; printf "%c%s" c (el 0));
  Array.iteri l.l2  ~f:(fun i c -> printf "%s" (rcp ()); up ~chars:i 4; printf "%c%s" c (el 0));
  Array.iteri l.l3  ~f:(fun i c -> printf "%s" (rcp ()); up ~chars:i 3; printf "%c%s" c (el 0));
  Array.iteri l.l4  ~f:(fun i c -> printf "%s" (rcp ()); up ~chars:i 2; printf "%c%s" c (el 0));
  Array.iteri l.l5  ~f:(fun i c -> printf "%s" (rcp ()); up ~chars:i 1; printf "%c%s" c (el 0));
  printf "%s" (rcp ())

let print_string ~chars:alph str =
  let a = String.to_array str in
  Array.iteri a
    ~f:(fun i c -> print_with_offset ~offset:(1 + i * 6)
                   @@ Option.value ~default:(make_letter ' ' "     " "     " "     " "     " "     " )
                   @@ Hashtbl.find alph c)

