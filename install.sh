#!/usr/bin/env bash
#
# dotfiles installer
# Usage: git clone <repo> ~/dotfiles && cd ~/dotfiles && ./install.sh
#
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}"

# ── Detect OS ──────────────────────────────────────────────
case "$(uname -s)" in
    Darwin) SYSTEM="macos" ;;
    Linux)  SYSTEM="linux" ;;
    *)      echo "Unsupported OS: $(uname -s)"; exit 1 ;;
esac

echo "╔══════════════════════════════════════╗"
echo "║         Dotfiles Installer           ║"
echo "╠══════════════════════════════════════╣"
echo "║  System:   $SYSTEM"
echo "║  Dotfiles: $DOTFILES_DIR"
echo "║  Target:   $CONFIG_DIR"
echo "╚══════════════════════════════════════╝"
echo ""

# ── Helpers ────────────────────────────────────────────────
link_file() {
    local src="$1" dst="$2"
    mkdir -p "$(dirname "$dst")"

    if [ -L "$dst" ]; then
        rm "$dst"
    elif [ -e "$dst" ]; then
        echo "  [backup] $dst → ${dst}.backup"
        mv "$dst" "${dst}.backup"
    fi

    ln -sf "$src" "$dst"
    echo "  [link]   $(basename "$dst")"
}

link_tree() {
    local src_dir="$1" dst_dir="$2"
    [ -d "$src_dir" ] || return 0

    find "$src_dir" -type f -not -path '*/.git/*' | sort | while read -r src_file; do
        local rel="${src_file#"$src_dir"/}"
        link_file "$src_file" "$dst_dir/$rel"
    done
}

# ── Safety check ───────────────────────────────────────────
if [ "$(realpath "$DOTFILES_DIR")" = "$(realpath "$CONFIG_DIR")" ]; then
    echo "⚠  Repo is already at $CONFIG_DIR — skipping symlinks."
    echo "   (move to e.g. ~/dotfiles and re-run to use symlink mode)"
else
    # ── Core configs ───────────────────────────────────────
    echo "==> Linking core configs..."
    link_tree "$DOTFILES_DIR/core" "$CONFIG_DIR"

    # ── System-specific configs ────────────────────────────
    echo ""
    echo "==> Linking $SYSTEM-specific configs..."
    if [ -d "$DOTFILES_DIR/systems/$SYSTEM" ]; then
        link_tree "$DOTFILES_DIR/systems/$SYSTEM" "$CONFIG_DIR"
    else
        echo "  (no system-specific configs for $SYSTEM)"
    fi

    # ── Make scripts executable ────────────────────────────
    chmod +x "$CONFIG_DIR/tmux/cpu.sh" 2>/dev/null || true
fi

# ── Git submodules ─────────────────────────────────────────
echo ""
echo "==> Initializing git submodules..."
cd "$DOTFILES_DIR"
git submodule update --init --recursive

# ── Fisher (fish plugin manager) ──────────────────────────
if command -v fish &> /dev/null; then
    echo ""
    echo "==> Installing fish plugins via fisher..."
    fish -c '
        if not functions -q fisher
            curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source
        end
        fisher update
    ' 2>/dev/null || echo "  [skip] fisher setup failed (run manually)"
fi

echo ""
echo "✓ Done! Restart your shell to apply changes."
