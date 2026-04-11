return {
  {
    "nvim-mini/mini.files",
    version = "*",
    cond = not vim.g.vscode,
    config = function()
      require("mini.files").setup()
    end,
  },
}
