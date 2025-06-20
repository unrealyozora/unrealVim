return {
  {
    'echasnovski/mini.nvim',
    cond = not vim.g.vscode,
    config = function()
      require('mini.icons').setup()
    end
  }
}
