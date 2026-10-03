-- yanky.nvim — clipboard history dan siklus paste yang lebih fleksibel.

return {
  {
    "gbprod/yanky.nvim",
    event = "VeryLazy",
    opts = {
      ring = { history_length = 100 },
    },
    keys = {
      {
        "<leader>p",
        "<cmd>YankyRingHistory<cr>",
        desc = "Buka History Clipboard",
      },
      { "y", "<Plug>(YankyYank)", mode = { "n", "x" }, desc = "Yank Text" },
      { "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" }, desc = "Put After" },
      { "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" }, desc = "Put Before" },
      { "[y", "<Plug>(YankyCycleForward)", desc = "Cycle Forward Paste" },
      { "]y", "<Plug>(YankyCycleBackward)", desc = "Cycle Backward Paste" },
    },
  },
}