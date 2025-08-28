# if status is-interactive
# end

alias tmux="tmux -u"
alias reattach="tmux attach-session"

alias ll="ls -l"
alias la="ls -a"
alias lla="ls -la"

# source $HOME/.config/fish/git_aliases.fish

set -gx PATH /opt/homebrew/bin $PATH;
set -gx PATH $HOME/q/m64 $PATH;
set -gx QHOME $HOME/q

set --global --export HOMEBREW_PREFIX "/opt/homebrew";
set --global --export HOMEBREW_CELLAR "/opt/homebrew/Cellar";
set --global --export HOMEBREW_REPOSITORY "/opt/homebrew";
fish_add_path --global --move --path "/opt/homebrew/bin" "/opt/homebrew/sbin";
if test -n "$MANPATH[1]"; set --global --export MANPATH '' $MANPATH; end;
if not contains "/opt/homebrew/share/info" $INFOPATH; set --global --export INFOPATH "/opt/homebrew/share/info" $INFOPATH; end;

thefuck --alias f | source 

abbr -a -- gs 'git status'
abbr -a -- gc 'git commit'
abbr -a -- gf 'git fetch'
abbr -a -- gp 'git push'
abbr -a -- gca 'git commit --amend --reset-author'
abbr -a -- gco 'git checkout'
abbr -a -- gcane 'git commit --amend --no-edit --reset-author'
abbr -a -- gpf 'git push --force-with-lease'
abbr -a -- gcanegpf 'git commit --amend --no-edit --reset-author && git push --force-with-lease'
abbr -a -- gad 'git add .'
abbr -a -- rv 'docker run -i --init --rm -v (PWD):/root ghcr.io/sampsyo/cs3410-infra'
abbr -a -- rvg 'docker run -i --init --rm -v (PWD):/root ghcr.io/sampsyo/cs3410-infra gcc -std=c23 -Wall'
abbr -a -- rvq 'docker run -i --init --rm -v (PWD):/root ghcr.io/sampsyo/cs3410-infra qemu'
