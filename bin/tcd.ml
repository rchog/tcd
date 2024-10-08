open Base
open Stdio
open Tcd
open Out_channel

let clear_space lines =
  for i = 0 to lines do
    let _ = i in
    printf "\n"
  done

let fail_usage () =
  printf
    "Arguments should be integers in descending order, e.g. hours (the largest \
     unit), minutes, seconds (the smallest unit).\n\
     Usage examples:\n\
     \t %s 0 10 0\n\
     \t %s 60\n"
    (Sys.get_argv ()).(0)
    (Sys.get_argv ()).(0);
  failwith "Invalid arguments."

let () =
  let args = Sys.get_argv () in
  let argn = ref @@ (Array.length args - 1) in
  if !argn = 0 then fail_usage ();
  let secs =
    ref @@ try Int.of_string args.(!argn) with Failure _ -> fail_usage ()
  in

  for i = 1 to !argn - 1 do
    let t =
      try Int.of_string args.(!argn - i) with Failure _ -> fail_usage ()
    in
    secs := !secs + (Int.pow 60 i * t)
  done;
  let get = function None -> assert false | Some v -> v in
  let alphabet = Letters.create_alphabet () in
  let nowtime = ref @@ Ptime_clock.now () in
  let endtime = get @@ Ptime.add_span !nowtime @@ Ptime.Span.of_int_s !secs in
  let diff = ref @@ Ptime.diff endtime !nowtime in
  let deltatime = ref @@ get @@ Ptime.of_span !diff in
  clear_space 5;
  while 0 < get @@ Ptime.Span.to_int_s !diff do
    let _, ((h, m, s), _) = Ptime.to_date_time !deltatime in
    Letters.print_string ~chars:alphabet
    @@ String.concat ~sep:":"
    @@ List.map [ h; m; s ] ~f:Int.to_string;
    flush stdout;
    nowtime := Ptime_clock.now ();
    diff := Ptime.diff endtime !nowtime;
    deltatime := get @@ Ptime.of_span !diff;
    Unix.sleep 1
  done;
  print_endline "Done!"
