function start_tmux_interactive --description "Inline fzf tmux session creator/attacher (default=scratch)"
    clear
    set -l sessions (tmux list-sessions -F "#{session_name}" 2>/dev/null)


    set -l out (printf "%s\n" $sessions | fzf --prompt="tmux> " --print-query --layout=reverse)
    set -l query     (string trim -- $out[1])
    set -l selection (string trim -- $out[2])
    clear

    if test -n "$selection"
        set choice $selection
    else if test -n "$query"
        set choice $query
    else
        set choice scratch
    end

    # Attach if exists, otherwise create new. Use exec for no flicker.
    tmux has-session -t "$choice" &> /dev/null
    if test $status -eq 0
        exec tmux attach-session -t "$choice"
    else
        exec tmux new-session -s "$choice"
    end
end

