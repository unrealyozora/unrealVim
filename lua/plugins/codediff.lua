return {
  "esmuellert/codediff.nvim",
  cond = not vim.g.vscode,
  dependencies = { "MunifTanjim/nui.nvim" },
  cmd = "CodeDiff",
}
