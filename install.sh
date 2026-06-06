#!/data/data/com.termux/files/usr/bin/bash

set -e

pkg update -y
pkg install -y openssl openssl-tool
pkg upgrade -y
pkg install -y neovim git curl wget

if [ -d "$HOME/.config/nvim" ]; then
    mv "$HOME/.config/nvim" "$HOME/.config/nvim.bak.$(date +%s)"
fi

for dir in "$HOME/.local/share/nvim" "$HOME/.local/state/nvim" "$HOME/.cache/nvim"; do
    [ -d "$dir" ] && mv "$dir" "${dir}.bak.$(date +%s)"
done

git clone https://github.com/LazyVim/starter "$HOME/.config/nvim"
rm -rf "$HOME/.config/nvim/.git"

mkdir -p "$HOME/.termux"
FONT_URL="https://github.com/nt-portal/LazyVim-Termux/raw/main/assest/font.ttf"
FONT_DEST="$HOME/.termux/font.ttf"

if wget -q -O "$FONT_DEST" "$FONT_URL"; then
    echo "Font downloaded (wget)"
elif curl -fL -o "$FONT_DEST" "$FONT_URL"; then
    echo "Font downloaded (curl)"
else
    echo "WARNING: Gagal download font, skip"
fi

PLUGINS="$HOME/.config/nvim/lua/plugins"
mkdir -p "$PLUGINS"

cat > "$PLUGINS/wakatime.lua" <<'EOF'
return {
  {
    "wakatime/vim-wakatime",
    lazy = false,
  },
}
EOF

cat > "$PLUGINS/noice-disable.lua" <<'EOF'
return {
  {
    "folke/noice.nvim",
    enabled = false,
  },
  {
    "rcarriga/nvim-notify",
    enabled = false,
  },
}
EOF

cat > "$PLUGINS/markview.lua" <<'EOF'
return {
  {
    "OXY2DEV/markview.nvim",
    lazy = false,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("markview").setup()
    end,
  },
}
EOF

cat >> "$HOME/.config/nvim/lua/config/options.lua" <<'EOF'

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true
vim.opt.mouse = "a"
vim.opt.conceallevel = 2
EOF

termux-reload-settings 2>/dev/null || true

echo "Done! Restart Termux lalu ketik: nvim"