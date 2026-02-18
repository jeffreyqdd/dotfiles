function cd
    set -l prev $PWD
    if test (count $argv) -eq 1 -a "$argv[1]" = -
        if set -q __cd_previous
            set -l target $__cd_previous
            set -g __cd_previous $prev
            builtin cd $target; and ls
        else
            echo "cd: no previous directory" >&2
            return 1
        end
    else
        set -g __cd_previous $prev
        builtin cd $argv; and ls
    end
end
