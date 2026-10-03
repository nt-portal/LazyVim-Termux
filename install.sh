#!/bin/bash
set -e
clear

STARTER="LazyVim/starter"
PLUGINS_LIST=(
  wakatime noice-disable markview transparent markmap
  codecompanion error-lens minuet dracula oil harpoon
  flash surround grug-far yanky dial aerial overseer
  todo-comments persistence
)
TOTAL_PLUGINS=${#PLUGINS_LIST[@]}

draw_bar() {
  local pct=$1
  local width=40
  local filled=$(( pct * width / 100 ))
  local empty=$(( width - filled ))
  printf "\r["
  for ((i=0; i<filled; i++)); do printf "="; done
  for ((i=0; i<empty; i++)); do printf " "; done
  printf "] %d%%" "$pct"
}

ARCH=$(uname -m)
REC_1=""
if [ "$ARCH" = "aarch64" ]; then REC_1=" (Rekomendasi)"; fi

echo "=== LazyVim Termux Installer ==="
echo ""
echo "Pilih Versi:"
echo "1. Stable (Rekomendasi)"
echo "2. Beta (Untuk tester)"
read -p "Pilih versi: " VERSI
echo ""

BRANCH="main"
if [ "$VERSI" = "2" ]; then BRANCH="beta"; fi

REPO="nt-portal/LazyVim-Termux"
BASE_URL="https://raw.githubusercontent.com/$REPO/$BRANCH/plugins"

echo "Pilih Lingkungan:"
echo "1. Termux Native ($ARCH)$REC_1"
echo "2. Termux Proot-Distro"
echo "3. Linux Ubuntu/Debian"
echo ""
read -p "Pilih opsi: " OPSI
echo ""

case $OPSI in
  1) INSTALL_CMD="pkg install -y" ;;
  2) INSTALL_CMD="apt update && apt install -y" ;;
  3) INSTALL_CMD="sudo apt update && sudo apt install -y" ;;
  *) echo "Opsi tidak valid."; exit 1 ;;
esac

echo "Memulai unduhan & konfigurasi..."
echo ""

draw_bar 5
$INSTALL_CMD git neovim nodejs yarn fd-find ripgrep clang curl > /dev/null 2>&1
draw_bar 15

mkdir -p ~/.config ~/.termux ~/.cache ~/.local/share ~/.local/state
draw_bar 20

for dir in ~/.config/nvim ~/.local/share/nvim ~/.local/state/nvim ~/.cache/nvim; do
  [ -e "$dir" ] || [ -L "$dir" ] && mv "$dir" "$dir.bak" || true
done
draw_bar 30

git clone --quiet "https://github.com/$STARTER" ~/.config/nvim 2>/dev/null
rm -rf ~/.config/nvim/.git
draw_bar 50

PLUGINS_DIR="$HOME/.config/nvim/lua/plugins"
mkdir -p "$PLUGINS_DIR"
BASE_URL_ASSET="https://raw.githubusercontent.com/$REPO/$BRANCH/assest"

for i in "${!PLUGINS_LIST[@]}"; do
  p=${PLUGINS_LIST[$i]}
  curl -sfL -o "$PLUGINS_DIR/$p.lua" "$BASE_URL/$p.lua"
  PROGRESS=$(( 50 + (i + 1) * 40 / TOTAL_PLUGINS ))
  draw_bar "$PROGRESS"
done

curl -sfL -o ~/.termux/font.ttf "$BASE_URL_ASSET/font.ttf"
draw_bar 95

termux-reload-settings > /dev/null 2>&1 || true
draw_bar 100
echo ""
echo ""

echo "Instalasi selesai!"
echo ""
echo "-------------------------------------------------------"
echo "PENTING: Silakan RESTART Termux atau Terminal Anda."
echo "Setelah restart, jalankan perintah: nvim"
echo "-------------------------------------------------------"
echo ""
echo "Catatan:"
echo "- Neovim akan mengunduh plugin saat pertama kali dibuka."
echo "- Pastikan koneksi internet stabil."
echo "- Baca panduan di: docs/LEARN.md"
echo ""
