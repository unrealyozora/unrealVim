vim.opt.termguicolors = true
require("config.lazy")
vim.g.have_nerd_font = true
require("lazy").setup({
  { "nvim-treesitter/nvim-treesitter", branch = 'master', lazy = false, build = ":TSUpdate" }
})


if vim.g.vscode then
  require "tom.vscode_keymaps"
else
  --ordinary
end
