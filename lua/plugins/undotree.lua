return {
  "jiaoshijie/undotree",
  ---@module 'undotree.collector'
  ---@type UndoTreeCollector.Opts
  opts = {
    -- your options
    position = "right",
  },
  keys = { -- load the plugin only when using it's keybinding:
    { "<leader>u", "<cmd>lua require('undotree').toggle()<cr>" },
  },
}
