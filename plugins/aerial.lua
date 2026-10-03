-- aerial.nvim — outline fungsi/class/variabel dari LSP/treesitter di sidebar.

return {
  {
    "stevearc/aerial.nvim",
    opts = {},
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    keys = {
      { "<leader>cs", "<cmd>AerialToggle!<cr>", desc = "Aerial (Symbols)" },
    },
  },
}