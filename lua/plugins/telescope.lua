-- plugins/telescope.lua:
return {
  cond = not vim.g.vscode,
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  -- or                              , branch = '0.1.x',
  dependencies = { "nvim-lua/plenary.nvim", { "nvim-telescope/telescope-fzf-native.nvim", build = "make" } },
  config = function()
    require("telescope").setup({
      defaults = {
        file_ignore_patterns = { "%.uid$" },
      },
      extensions = {
        fzf = {},
      },
    })
    require("telescope").load_extension("fzf")
  end,
}
