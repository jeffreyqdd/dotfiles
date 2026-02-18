# Dotfiles

Portable dotfiles with a core/system split. Clone on any machine, run the installer, done.

## Structure

```
dotfiles/
├── install.sh              # Symlinks everything into ~/.config
├── core/                   # Portable configs (all systems)
│   ├── fish/               # Shell: aliases, abbrs, functions, plugins
│   ├── tmux/               # Multiplexer: keybinds, UI, colors
│   ├── vim/                # Editor: settings, ctrlp plugin
│   └── thefuck/            # Command correction
└── systems/                # OS-specific overrides
    ├── macos/              # Homebrew, deno, opam, macOS cpu.sh
    └── linux/              # Linux paths, /proc-based cpu.sh
```

**Core configs auto-detect the OS** and source the matching `systems/<os>/` files at runtime.

## Install

```bash
git clone --recursive <repo-url> ~/dotfiles
cd ~/dotfiles
./install.sh
```

The installer will:
1. Symlink `core/*` into `~/.config/`
2. Symlink `systems/<detected-os>/*` into `~/.config/` (overlays on top)
3. Initialize git submodules (ctrlp.vim)
4. Install fish plugins via fisher

Existing files are backed up to `<file>.backup` before linking.

## Adding a new system

```bash
mkdir -p systems/freebsd/fish
echo '# FreeBSD-specific config' > systems/freebsd/fish/system.fish
```

The core configs will pick it up automatically via `uname -s`.

## Adding new tools

1. Put portable config in `core/<tool>/`
2. Put OS-specific bits in `systems/<os>/<tool>/`
3. Update `install.sh` if the tool needs special setup

## Key Bindings (tmux)

| Key | Action |
|-----|--------|
| `C-f` | Prefix |
| `h/j/k/l` | Pane navigation |
| `H/J/K/L` | Pane resize |
| `o/p` | Prev/next window |
| `!/@` | Mouse on/off |
| `$` | Sync panes toggle |
| `r` | Reload config |

## Vim CheatSheet

### Buffers

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
    - `:vsp filename`
    - `:sp filename`
    - `:sbN` (implies `:sb` is valid)
    - `:vert sbN`
4. **Closing buffers**
    - `:bd`
    - `:bdN`

### Notes

- Need to set tmux to copy to system clipboard
- Need to send option/alt to tmux
- For iterm2: Profile > keys > left option to esc+
