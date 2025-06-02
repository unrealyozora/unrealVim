vim.opt.termguicolors = true
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
require("config.lazy")
vim.g.have_nerd_font = true


if vim.g.vscode then
  require "tom.vscode_keymaps"
else
  --ordinary
end
