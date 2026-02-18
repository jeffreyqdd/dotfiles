function fish_prompt
    set -l last_status $status
    set -l cwd (prompt_pwd)
    set -l git_branch (command git branch --show-current 2>/dev/null)

    # first line: directory + git branch
    set_color blue
    echo -n $cwd
    if test -n "$git_branch"
        set_color normal
        echo -n " "
        set_color magenta
        echo -n $git_branch
    end
    echo

    # second line: prompt symbol
    if test $last_status -eq 0
        set_color magenta
    else
        set_color red
    end
    echo -n "❯ "
    set_color normal
end
