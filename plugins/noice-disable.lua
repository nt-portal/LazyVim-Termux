-- Menonaktifkan noice.nvim dan nvim-notify.
-- Keduanya sudah jadi bawaan LazyVim, tapi dinonaktifkan agar ringan di Android.

return {
  {
    "folke/noice.nvim",
    enabled = false,
  },
  {
    "rcarriga/nvim-notify",
    enabled = false,
  },
}