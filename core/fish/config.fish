# ========= Core Fish Configuration =========

# ========= System-Specific Config =========
set -g DOTFILES_DIR (realpath (status dirname)/../..)

switch (uname -s)
    case Darwin
        set -g DOTFILES_SYSTEM macos
    case Linux
        set -g DOTFILES_SYSTEM linux
    case '*'
        set -g DOTFILES_SYSTEM unknown
end

if test -f "$DOTFILES_DIR/dotfiles/systems/$DOTFILES_SYSTEM/fish/system.fish"
    source "$DOTFILES_DIR/dotfiles/systems/$DOTFILES_SYSTEM/fish/system.fish"
end

# ========= Aliases =========
alias reattach="tmux attach-session"
alias ll="ls -l"
alias la="ls -a"
alias lla="ls -la"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# ========= Git Abbreviations =========
abbr -a -- gs 'git status'
abbr -a -- gc 'git commit'
abbr -a -- gf 'git fetch'
abbr -a -- gp 'git push'
abbr -a -- gca 'git commit --amend --reset-author'
abbr -a -- gco 'git checkout'
abbr -a -- gb 'git branch'
abbr -a -- gcane 'git commit --amend --no-edit --reset-author'
abbr -a -- gpf 'git push --force-with-lease'
abbr -a -- gcanegpf 'git commit --amend --no-edit --reset-author && git push --force-with-lease'
abbr -a -- gad 'git add .'

# ========= Conditional Tool Init =========
if command -q thefuck
    thefuck --alias f | source
end

if test -f "$HOME/.cargo/env.fish"
    source "$HOME/.cargo/env.fish"
end

if test -f "$HOME/.local/bin/env.fish"
    source "$HOME/.local/bin/env.fish"
end

