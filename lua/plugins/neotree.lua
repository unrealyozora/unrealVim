return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    cond = not vim.g.vscode,
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    config = function()
      local MIN_WIDTH = 120
      vim.api.nvim_create_autocmd({ "VimResized" }, {
        callback = function()
          local width = vim.o.columns
          local neotree = require("neo-tree.command")

          if width < MIN_WIDTH then
            pcall(function()
              neotree.execute({ action = "close" })
            end)
          else
            pcall(function()
              neotree.execute({ action = "show" })
            end)
          end
        end,
      })
    end,
    lazy = false, -- neo-tree will lazily load itself
    --@module 'neo-tree'
    --#type neotree.Config
    opts = {
      close_if_last_window = true,
      default_component_configs = {
        git_status = {
          symbols = {
            added = "✚",
            modified = "",
            deleted = "✖",
            renamed = "󰁕",
            untracked = "",
            ignored = "",
            unstaged = "󰄱",
            staged = "",
            conflict = "",
          },
        },
      },
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_hidden = false,
        },
        follow_current_file = {
          enabled = true,
          leave_dirs_open = false,
        },
      },
    },
  },
}
