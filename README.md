A silly ASCII clock counting down to zero from the provided number of seconds in a tremendously ugly way.

![gif](tcd.gif)

## Installation
`dune build` in the project root should generate an executable file `tcd.exe` in `_build/default/bin/`. Place this somewhere in your `$PATH` or use `dune install`, which will most likely place the executable as `~/.opam/default/bin/tcd`

## Usage
To use, call tcd with an integer value as the first argument: `tcd 61` would count down from 1 minute, 1 second. You can also give larger units of time by separating the arguments by spaces: `tcd 2 0` counts down from two minutes and `tcd 1 0 10` counts down from 1 hour and 10 seconds.
