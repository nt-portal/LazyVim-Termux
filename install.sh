#!/data/data/com.termux/files/usr/bin/bash

# Update and install dependencies
pkg update -y
pkg install -y neovim git curl

# Required: backup existing nvim config
if [ -d "$HOME/.config/nvim" ]; then
    echo "Backing up existing nvim config..."
    mv "$HOME/.config/nvim" "$HOME/.config/nvim.bak"
fi

# Optional but recommended: backup other nvim related dirs
for dir in "$HOME/.local/share/nvim" "$HOME/.local/state/nvim" "$HOME/.cache/nvim"; do
    if [ -d "$dir" ]; then
        echo "Backing up $dir..."
        mv "$dir" "$dir.bak"
    fi
done

# Clone LazyVim starter
echo "Cloning LazyVim starter..."
git clone https://github.com/LazyVim/starter "$HOME/.config/nvim"

# Remove .git from the cloned config
rm -rf "$HOME/.config/nvim/.git"

# Setup font
echo "Setting up font..."
mkdir -p "$HOME/.termux"
curl -L -o "$HOME/.termux/font.ttf" "https://github.com/nt-portal/LazyVim-Termux/raw/main/assest/font.ttf"

# Create plugins directory
mkdir -p "$HOME/.config/nvim/lua/plugins"

# Add WakaTime plugin
echo "Configuring WakaTime..."
cat <<EOF > "$HOME/.config/nvim/lua/plugins/wakatime.lua"
return {
  {
    "wakatime/vim-wakatime",
    lazy = false,
    event = { "BufReadPost", "BufNewFile" },
  },
}
EOF

# Disable Noice plugin
echo "Disabling Noice..."
cat <<EOF > "$HOME/.config/nvim/lua/plugins/noice-disable.lua"
return {
  {
    "folke/noice.nvim",
    enabled = false,
  },
}
EOF

# Reload Termux settings to apply font
termux-reload-settings

echo "Installation complete! Run 'nvim' to start LazyVim."
