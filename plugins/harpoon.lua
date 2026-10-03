-- harpoon — bookmark dan navigasi cepat antar file kerja.

return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      settings = {
        save_on_toggle = true,
      },
    },
    keys = function()
      local harpoon = require("harpoon")
      return {
        {
          "<leader>h",
          function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
          end,
          desc = "Harpoon Menu",
        },
        {
          "<leader>ha",
          function()
            harpoon:list():add()
          end,
          desc = "Harpoon Tambah File",
        },
        {
          "<leader>1",
          function()
            harpoon:list():select(1)
          end,
          desc = "Harpoon File 1",
        },
        {
          "<leader>2",
          function()
            harpoon:list():select(2)
          end,
          desc = "Harpoon File 2",
        },
        {
          "<leader>3",
          function()
            harpoon:list():select(3)
          end,
          desc = "Harpoon File 3",
        },
        {
          "<leader>4",
          function()
            harpoon:list():select(4)
          end,
          desc = "Harpoon File 4",
        },
      }
    end,
  },
}