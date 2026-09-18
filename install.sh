#!/data/data/com.termux/files/usr/bin/bash
set -e
clear
pkg install -y git neovim nodejs yarn fd grep clang curl

mkdir -p ~/.config ~/.termux ~/.cache
mkdir -p ~/.local/share ~/.local/state

[ -e ~/.config/nvim ] || [ -L ~/.config/nvim ] && mv ~/.config/nvim ~/.config/nvim.bak || true
[ -e ~/.local/share/nvim ] || [ -L ~/.local/share/nvim ] && mv ~/.local/share/nvim ~/.local/share/nvim.bak || true
[ -e ~/.local/state/nvim ] || [ -L ~/.local/state/nvim ] && mv ~/.local/state/nvim ~/.local/state/nvim.bak || true
[ -e ~/.cache/nvim ] || [ -L ~/.cache/nvim ] && mv ~/.cache/nvim ~/.cache/nvim.bak || true

git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

PLUGINS="$HOME/.config/nvim/lua/plugins"
mkdir -p "$PLUGINS"

BASE="https://raw.githubusercontent.com/nt-portal/LazyVim-Termux/main/plugins"
for p in wakatime noice-disable markview transparent markmap codecompanion error-lens; do
  curl -fL -o "$PLUGINS/$p.lua" "$BASE/$p.lua"
done

curl -fL -o ~/.termux/font.ttf "https://github.com/nt-portal/LazyVim-Termux/raw/main/assest/font.ttf"

termux-reload-settings

nvim
