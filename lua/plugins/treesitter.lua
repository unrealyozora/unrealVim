return {
  {
    "nvim-treesitter/nvim-treesitter",
    cond = not vim.g.vscode,
    build = ":TSUpdate"
  },
}
