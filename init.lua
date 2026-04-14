vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- Usa sempre un nome valido per la pipe
local pipe_name

local prova
local function start_godot_server()
  local project_root = vim.fn.getcwd()
  if vim.fn.has("win32") == 1 then
    pipe_name = "\\\\.\\pipe\\godot_nvim"
  else
    pipe_name = "/tmp/godot_nvim"
  end

  local godot_project = vim.fn.findfile("project.godot", project_root .. ";")
  if godot_project ~= "" then
    vim.fn.serverstart(pipe_name)
    print("Neovim server started on " .. pipe_name)
  end
end

vim.api.nvim_create_autocmd("VimEnter", {
  callback = start_godot_server,
})

vim.opt.shell = "pwsh"
vim.opt.termguicolors = true
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
require("config.lazy")
vim.g.have_nerd_font = true

--command to spawn a small terminal
vim.keymap.set("n", "<space>st", function()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 10)
end)

--command to set .vs and .fs files to glsl type (if you work with fsharp, .fs causes conflicts)
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = { "*.vs", "*.fs" },
  callback = function()
    vim.bo.filetype = "glsl"
  end,
})

--diagnostic icons setup
vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.INFO] = "",
      [vim.diagnostic.severity.HINT] = "󰌵",
    },
  },
})

if vim.g.vscode then
  require("tom.vscode_keymaps")
else
  vim.opt.showmode = false
end
