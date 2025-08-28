# My Terminal Conf

Need to use tmux and fish in your workflows

1. install fish, ctags
2. need to set tmux to copy to system clipboard
3. need to send option/alt to tmux
4. for iterm2 Profile > keys > left option to esc+ (TODO: tmux seems to eat the alt key on iterm2, and I still haven't found a way to fix that)

# Vim CheatSheet
## Buffers
A buffer is vim's in-memory representation of a file. `:e` loads a file into the current buffer. Buffers are global, and can be opened in any window or tab.

1. **List all open buffers**: `:ls`
    - `%` is the current buffer
    - `a` buffer is in an active window
    - `#` alternative/previous buffer
2. **Switching between buffers**:
    - `:bn`/`:bp` jumps to next/prev buffers
    - `:bN` jumps to buffer number N, 
    - `:b#` toggle last buffer
3. **Splits**
    - `:vsp flename`
    - `:sp filename`
    - `:sbN` (implies `:sb` is valid)
    - `:vert sbN`
4. **Closing buffers**
    - `:bd`
    - `:bdN`

## Splits
