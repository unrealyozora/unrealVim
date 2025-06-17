local telescope = require("telescope.builtin")
local M = {}

function M.dev_folder()
  local dev_path = "~\\Dev"

  telescope.find_files({
    prompt_title = "Find Development Folder",
    cwd = dev_path,
    find_command = { "fd", "--type", "d", "--max-depth", "1", "--hidden", "--exclude", ".git" },
    sorter = require("telescope.config").values.generic_sorter({}),
  })
end

return M
