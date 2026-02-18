# ========= macOS-Specific Fish Configuration =========

# Homebrew
set --global --export HOMEBREW_PREFIX "/opt/homebrew"
set --global --export HOMEBREW_CELLAR "/opt/homebrew/Cellar"
set --global --export HOMEBREW_REPOSITORY "/opt/homebrew"
fish_add_path --global --move --path "/opt/homebrew/bin" "/opt/homebrew/sbin"
if test -n "$MANPATH[1]"; set --global --export MANPATH '' $MANPATH; end
if not contains "/opt/homebrew/share/info" $INFOPATH
    set --global --export INFOPATH "/opt/homebrew/share/info" $INFOPATH
end

# Deno
if test -f "$HOME/.deno/env.fish"
    source "$HOME/.deno/env.fish"
end

# opam (OCaml)
if test -f "$HOME/.opam/opam-init/init.fish"
    source "$HOME/.opam/opam-init/init.fish" > /dev/null 2> /dev/null; or true
end

# CS3410 Docker abbreviations
abbr -a -- rv 'docker run -i --init --rm -v (PWD):/root ghcr.io/sampsyo/cs3410-infra'
abbr -a -- rvg 'docker run -i --init --rm -v (PWD):/root ghcr.io/sampsyo/cs3410-infra gcc -std=c23 -Wall'
abbr -a -- rvq 'docker run -i --init --rm -v (PWD):/root ghcr.io/sampsyo/cs3410-infra qemu'
abbr -a -- rv-debug 'docker run -it --rm --init -e NETID=jq54 --name testing --ulimit core=-1 --mount type=bind,source="$PWD"/,target="$PWD"/ -v "$PWD":/root ghcr.io/sampsyo/cs3410-infra'
abbr -a -- rv-gdb 'docker exec -it testing gdb -q -ex "target remote localhost:1234" -ex "set sysroot /opt/riscv/sysroot" -ex "set can-use-hw-watchpoints 0"'
