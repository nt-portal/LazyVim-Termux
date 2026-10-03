-- transparent.nvim — background Neovim transparan, mengikuti wallpaper Termux.

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