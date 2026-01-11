return {
  "nvim-java/nvim-java",
  ft = "java",
  cond = not vim.g.vscode,
  config = function()
    require("java").setup()
    vim.lsp.enable("jdtls")
  end,
}
