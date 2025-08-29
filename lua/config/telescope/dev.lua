local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

local M = {}

function M.dev_folder()
  local dev_path = vim.fn.expand("~/Dev")

  pickers
    .new({}, {
      prompt_title = "Dev Projects",
      finder = finders.new_oneshot_job({
        "fd",
        "--type",
        "d",
        "--max-depth",
        "1",
        "--hidden",
        "--exclude",
        ".git",
      }, { cwd = dev_path }),
      sorter = conf.generic_sorter({}),
      attach_mappings = function(prompt_bufnr, map)
        actions.select_default:replace(function()
          actions.close(prompt_bufnr)
          local selection = action_state.get_selected_entry()
          if not selection then
            return
          end

          -- Build absolute path
          local target_dir = vim.fn.fnamemodify(dev_path .. "\\" .. selection[1], ":p")
          target_dir = target_dir:gsub("\\$", "")
          target_dir = target_dir:gsub("/", "\\")

          local cmd = string.format('wt -d "%s"', target_dir)
          os.execute(cmd)
          print("Opening new Windows Terminal tab in " .. target_dir)
        end)
        return true
      end,
    })
    :find()
end

return M
