-- todo-comments.nvim — sorot dan cari anotasi TODO, FIXME, HACK, dan FIXME di kode.

return {
  {
    "folke/todo-comments.nvim",
    event = "VeryLazy",
    opts = {
      signs = {
        items = {
          { text = " todo ", priority = 2 },
          { text = " fixme ", priority = 2 },
          { text = " hack ", priority = 2 },
          { text = " warn ", priority = 2 },
          { text = " note ", priority = 2 },
        },
      },
      keywords = {
        FIXME = { icon = " " },
        HACK = { icon = " " },
        NOTE = { icon = " " },
        TODO = { icon = " " },
        WARN = { icon = " " },
      },
    },
    keys = {
      {
        "<leader>/",
        "<cmd>TodoTelescope<cr>",
        desc = "Cari TODO/FIXME/HACK",
      },
    },
  },
}