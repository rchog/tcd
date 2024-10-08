
(** The CSI sequence followed by `s`. *)
let csi s = "\x1b[" ^ s

(** Cursor Up. Moves the cursor `n` cells in the given direction. *)
let cuu n = csi @@ Int.to_string n ^ "A"

(** Cursor Down. Moves the cursor `n` cells in the given direction. *)
let cud n = csi @@ Int.to_string n ^ "B"

(** Cursor Forward. Moves the cursor `n` cells in the given direction. *)
let cuf n = csi @@ Int.to_string n ^ "C"

(** Cursor Back. Moves the cursor `n` cells in the given direction. *)
let cub n = csi @@ Int.to_string n ^ "D"

(** Cursor next line moves to beginning of line `n` lines down. *)
let cnl n = csi @@ Int.to_string n ^ "E"

(** Cursor previous line moves to beginning of line `n` lines up. *)
let cpl n = csi @@ Int.to_string n ^ "F"

(** Cursor horizontal absolute. *)
let cha n = csi @@ Int.to_string n ^ "G"

(** Moves the cursor to row n, column m. The values are 1-based, and default to 1 (top left corner) if omitted. *)
let cup n m = csi @@ Int.to_string n ^ ";" ^ Int.to_string m ^ "H"

(** Clears part of the screen. If n is 0 (or missing), clear from cursor to end of screen. If n is 1, clear from cursor to beginning of the screen. If n is 2, clear entire screen (and moves cursor to upper left on DOS ANSI.SYS). If n is 3, clear entire screen and delete all lines saved in the scrollback buffer. *)
let ed n = csi @@ Int.to_string n ^ "J"

(** Erases part of the line. If n is 0 (or missing), clear from cursor to the end of the line. If n is 1, clear from cursor to beginning of the line. If n is 2, clear entire line. Cursor position does not change. *)
let el n = csi @@ Int.to_string n ^ "K"

(** SCP - Save Current Cursor Position *)
let scp () = csi @@ "s"

(** RCP - Restore Current Cursor Position *)
let rcp () = csi @@ "u"
