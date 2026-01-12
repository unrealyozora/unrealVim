return {
  "windwp/nvim-autopairs",
  cond = not vim.g.vscode,
  dependencies = { "windwp/nvim-ts-autotag" },
  event = "InsertEnter",
  config = function()
    require("nvim-autopairs").setup({})
    require("nvim-ts-autotag").setup({
      filetypes = {
        "html",
        "xml",
        "xhtml",
        "javascriptreact",
        "typescriptreact",
      },
    })
  end,
  -- use opts = {} for passing setup options
  -- this is equivalent to setup({}) function
}
