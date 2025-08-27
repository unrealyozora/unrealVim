local uv = vim.uv or vim.loop
local cwd = vim.fn.getcwd()
local project_name = vim.fn.fnamemodify(cwd, ":t") -- nome della cartella corrente

-- Usa sempre un nome valido per la pipe
local pipe_name
if vim.fn.has("win32") == 1 then
  pipe_name = "\\\\.\\pipe\\godot_nvim_"
else
  pipe_name = "/tmp/godot_nvim_"
end

-- Avvia server solo se non è già attivo
local ok, err = pcall(vim.fn.serverstart, pipe_name)
if not ok then
  vim.notify("Failed to start Neovim Server at " .. pipe_name .. ": " .. tostring(err), vim.log.levels.ERROR)
else
  vim.notify("Neovim server started at " .. pipe_name)
end

vim.lsp.set_log_level("debug")
vim.opt.shell = "fish"
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

if vim.g.vscode then
  require("tom.vscode_keymaps")
else
  vim.opt.showmode = false
end
