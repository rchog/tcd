(lang dune 3.15)

(name tcd)

(generate_opam_files true)

(source
 (github rchog/tcd))

(authors "rchog")

(maintainers "none")

(license LICENSE)

(documentation README.md)

(package
 (name tcd)
 (synopsis "Terminal countdown")
 (description "A silly ASCII clock counting down to zero from the provided number of seconds in a tremendously ugly way.")
 (depends ocaml dune)
 (tags
  (countdown timer tui pomodoro)))

; See the complete stanza docs at https://dune.readthedocs.io/en/stable/dune-files.html#dune-project
