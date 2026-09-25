#!/data/data/com.termux/files/usr/bin/bash
set -e
clear

# ─── Progress helper ──────────────────────────────────────
# Git-style progress on a single line using \r
# Usage: progress "Label" current total
# Final: progress_done "Label" total ["suffix"]
_tty=0; [ -t 1 ] && _tty=1

progress() {
  local label="$1" cur="$2" total="$3"
  local pct=$(( cur * 100 / total ))
  if [ "$_tty" -eq 1 ]; then
    printf "\r%-22s %3d%% (%d/%d)" "$label" "$pct" "$cur" "$total"
  fi
}

progress_done() {
  local label="$1" total="$2" suffix="${3:-done.}"
  if [ "$_tty" -eq 1 ]; then
    printf "\r%-22s %3d%% (%d/%d), %s\n" "$label" 100 "$total" "$total" "$suffix"
  else
    printf "%-22s %s\n" "$label" "$suffix"
  fi
}

# ─── Phase 1: Dependencies ────────────────────────────────
DEPS=(git neovim nodejs yarn fd grep clang curl)
DEP_TOTAL=${#DEPS[@]}
echo "Installing dependencies..."
idx=0
for dep in "${DEPS[@]}"; do
  idx=$((idx + 1))
  progress "Resolving packages:" "$idx" "$DEP_TOTAL"
done
# Actual install (suppress output to keep it clean)
pkg install -y "${DEPS[@]}" > /dev/null 2>&1
progress_done "Resolving packages:" "$DEP_TOTAL"

# ─── Phase 2: Prepare directories ─────────────────────────
printf "%-22s %s\n" "Preparing paths:" "creating directories..."
mkdir -p ~/.config ~/.termux ~/.cache
mkdir -p ~/.local/share ~/.local/state

# ─── Phase 3: Backup existing config ──────────────────────
BACKUP_COUNT=0
for d in ~/.config/nvim ~/.local/share/nvim ~/.local/state/nvim ~/.cache/nvim; do
  if [ -e "$d" ] || [ -L "$d" ]; then
    mv "$d" "${d}.bak" 2>/dev/null || true
    BACKUP_COUNT=$((BACKUP_COUNT + 1))
  fi
done
if [ "$BACKUP_COUNT" -gt 0 ]; then
  printf "%-22s %s\n" "Backup:" "${BACKUP_COUNT} existing config(s) backed up."
else
  printf "%-22s %s\n" "Backup:" "nothing to back up."
fi

# ─── Phase 4: Clone LazyVim starter ───────────────────────
printf "%-22s %s" "Cloning starter:" "LazyVim/starter..."
git clone --quiet https://github.com/LazyVim/starter ~/.config/nvim 2>/dev/null
rm -rf ~/.config/nvim/.git
printf "\r%-22s %s\n" "Cloning starter:" "done."

# ─── Phase 5: Download plugins ────────────────────────────
PLUGINS="$HOME/.config/nvim/lua/plugins"
mkdir -p "$PLUGINS"

BASE="https://raw.githubusercontent.com/nt-portal/LazyVim-Termux/main/plugins"
PLUGIN_LIST=(wakatime noice-disable markview transparent markmap codecompanion error-lens minuet dracula)
PLUGIN_TOTAL=${#PLUGIN_LIST[@]}

idx=0
for p in "${PLUGIN_LIST[@]}"; do
  idx=$((idx + 1))
  progress "Receiving objects:" "$idx" "$PLUGIN_TOTAL"
  curl -sfL -o "$PLUGINS/$p.lua" "$BASE/$p.lua"
done
progress_done "Receiving objects:" "$PLUGIN_TOTAL"

# ─── Phase 6: Download font ───────────────────────────────
printf "%-22s %s" "Downloading font:" "JetBrainsMono NF..."
curl -sfL -o ~/.termux/font.ttf \
  "https://github.com/nt-portal/LazyVim-Termux/raw/main/assest/font.ttf"
printf "\r%-22s %s\n" "Downloading font:" "done."

# ─── Phase 7: Finalize ────────────────────────────────────
termux-reload-settings 2>/dev/null || true

echo ""
echo "Setup complete."
echo ""
echo "  Plugins:  ${PLUGIN_TOTAL} configs installed"
echo "  Theme:    dracula"
echo "  Font:     JetBrainsMono Nerd Font"
echo "  Config:   ~/.config/nvim/lua/plugins/"
echo ""
echo "Starting Neovim..."
echo ""

nvim
