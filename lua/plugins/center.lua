return {
  "shortcuts/no-neck-pain.nvim",
  version = "*",
  cond = not vim.g.vscode,
  config = function()
    require("no-neck-pain").setup {
      buffers = {
        scratchPad = {
          enabled = true,
          location = 'nil',
        },
        bo = {
          filetype = "md"
        },
        wo = {
          fillchars = "eob: ",
        },
      },
    }
  end

}
