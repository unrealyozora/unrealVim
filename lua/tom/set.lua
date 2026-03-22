vim.opt.guicursor = ""
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 8
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.smartindent = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

if not vim.g.vscode then
  --these sets causes vscode-neovim extension to fail, they are not needed anyways
  vim.opt.wrap = false
  vim.opt.swapfile = false
  vim.opt.backup = false
  local undodir = vim.fn.stdpath("data") .. "/undodir"
  vim.fn.mkdir(undodir, "p")
  vim.opt.undodir = undodir
  vim.opt.undofile = true
else
end
