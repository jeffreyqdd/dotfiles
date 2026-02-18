" macOS-specific vim configuration

" opam / OCaml indent
if isdirectory($HOME . '/.opam')
    set rtp^=$HOME/.opam/cs4160/share/ocp-indent/vim
endif
