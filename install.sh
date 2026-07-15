#!bash/Termux LazyVim
clear
apt install -y git neovim nodejs yarn

mv ~/.config/nvim{,.bak}
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}

git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

PLUGINS="$HOME/.config/nvim/lua/plugins"
mkdir -p "$PLUGINS"

echo 'return {
  {
    "wakatime/vim-wakatime",
    lazy = false,
  },
}' >"$PLUGINS/wakatime.lua"

echo 'return {
  {
    "folke/noice.nvim",
    enabled = false,
  },
  {
    "rcarriga/nvim-notify",
    enabled = false,
  },
}' >"$PLUGINS/noice-disable.lua"

echo 'return {
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
}' >"$PLUGINS/markview.lua"

cat >"$PLUGINS/transparent.lua" <<'EOF'
return {
  "xiyaowong/transparent.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("transparent").setup({
      extra_groups = {
        "NormalFloat",
        "NeoTreeNormal",
        "NeoTreeNormalNC",
        "Dashboard",
      },
    })
    vim.g.transparent_enabled = true
  end,
}
EOF

cat >"$PLUGINS/markmap.lua" <<'EOF'
return {
  {
    "Zeioth/markmap.nvim",
    build = "yarn global add markmap-cli",
    cmd = {
      "MarkmapOpen",
      "MarkmapSave",
      "MarkmapWatch",
      "MarkmapWatchStop",
    },
  },
}
EOF

cat >"$PLUGINS/codecompanion.lua" <<'EOF'
return {
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      strategies = {
        chat = {
          adapter = "gemini",
        },
        inline = {
          adapter = "gemini",
        },
      },
    },
  },
}
EOF

curl -fL -o ~/.termux/font.ttf "https://github.com/nt-portal/LazyVim-Termux/raw/main/assest/font.ttf"

termux-reload-settings

nvim
