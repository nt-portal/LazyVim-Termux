-- Dracula — tema gelap dengan aksen ungu, pink, dan hijau.

return {
  {
    "Mofiqul/dracula.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("dracula")
    end,
  },
}