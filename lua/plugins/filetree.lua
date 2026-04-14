return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    lazy = false, -- neo-tree will lazily load itself

    ---@module 'neo-tree'
    ---@type neotree.Config
    opts = {
      filesystem = {
        follow_current_file = {
          enabled = true,
        },
      },
      auto_clean_after_session_restore = true,
      close_if_last_window = true,
      buffers = {
        follow_current_file = {
          enabled = true,
        },
      },
      window = {
        mappings = {
          ["P"] = {
            "toggle_preview",
            config = {
              use_float = true,
              -- use_image_nvim = true,
              -- use_snacks_image = true,
              -- title = 'Neo-tree Preview',
            },
          },
        },
      },
    },
  },
}
