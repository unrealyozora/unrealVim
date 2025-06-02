-- plugins/telescope.lua:
return {
  cond = not vim.g.vscode,
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  -- or                              , branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim' }
}
