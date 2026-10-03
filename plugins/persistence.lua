-- persistence.nvim — simpan dan pulihkan session kerja (buffer, layout, pilihan).

return {
  {
    "folke/persistence.nvim",
    event = "VeryLazy",
    opts = {
      dir = vim.fn.stdpath("state") .. "/sessions",
      save_on_detach = false,
    },
    keys = {
      {
        "<leader>qs",
        function()
          require("persistence").save()
        end,
        desc = "Simpan Session",
      },
      {
        "<leader>ql",
        function()
          require("persistence").load()
        end,
        desc = "Muat Session Terakhir",
      },
    },
  },
}