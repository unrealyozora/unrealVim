local telescope = require("telescope.builtin")
local M = {}

function M.nvim_config_files()
  local config_path = vim.fn.stdpath("config")

  telescope.find_files({
    prompt_title = "Neovim Config Files",
    cwd = config_path,
  })
end

return M
