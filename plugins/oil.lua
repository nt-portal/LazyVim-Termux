-- oil.nvim — kelola file dan folder seperti buffer teks biasa.

return {
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
    keys = {
      { "-", "<cmd>Oil<cr>", desc = "Buka direktori di Oil" },
    },
  },
}