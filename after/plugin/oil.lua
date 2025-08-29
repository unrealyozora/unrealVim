local function open_windows_terminal()
  local oil = require("oil")
  local path = oil.get_current_dir()

  if not path or path == "" then
    vim.notify("Error: can't obtain current cirectory from oil.nvim", vim.log.levels.ERROR)
    return
  end
  local cmd = string.format('wt -d "%s', path)
  os.execute(cmd)
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = "oil",
  callback = function()
    vim.keymap.set("n", "tt", open_windows_terminal, { buffer = true, desc = "Open windows terminal" })
  end,
})

vim.keymap.set("n", "<leader>pv", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set("n", "<leader>pr", function()
  require("oil").open(vim.fn.getcwd())
end, { desc = "Open Oil at project root" })
