return
{
  'nvim-lualine/lualine.nvim',
  cond = not vim.g.vscode,
  dependencies = { 'nvim-tree/nvim-web-devicons' }
}
