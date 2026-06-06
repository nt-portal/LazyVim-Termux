pkg install -y git neovim

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
}' > "$PLUGINS/wakatime.lua"

echo 'return {
  {
    "folke/noice.nvim",
    enabled = false,
  },
  {
    "rcarriga/nvim-notify",
    enabled = false,
  },
}' > "$PLUGINS/noice-disable.lua"

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
}' > "$PLUGINS/markview.lua"

curl -fL -o ~/.termux/font.ttf "https://github.com/nt-portal/LazyVim-Termux/raw/main/assest/font.ttf"

termux-reload-settings

exit