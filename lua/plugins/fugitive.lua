return {
  {
    "tpope/vim-fugitive",
    cond = not vim.g.vscode,
    config = function()
      vim.keymap.set("n", "<leader>gs", function()
        vim.cmd("vert Git")
      end, { desc = "Open Git status" })
    end,
  },
}
