-- markmap.nvim — mind map visual dari file Markdown.
-- Membutuhkan markmap-cli, diinstall otomatis lewat build.

return {
  {
    "Zeioth/markmap.nvim",
    build = "yarn global add markmap-cli",
    cmd = {
      "MarkmapOpen",
      "MarkmapSave",
      "MarkmapWatch",
      "MarkmapWatchStop",
    },
  },
}