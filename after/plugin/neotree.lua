local MIN_WIDTH = 120
vim.api.nvim_create_autocmd({ "VimResized", "WinEnter" }, {
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
