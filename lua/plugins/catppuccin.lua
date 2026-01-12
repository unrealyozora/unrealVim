return {
  "catppuccin/nvim",
  cond = not vim.g.vscode,
  name = "catppuccin",
  priority = 1000,
  cond = not vim.g.vscode,
  config = function()
    require("catppuccin").setup({
      transparent_background = true,
      show_end_of_buffer = true,
      term_colors = true,
      auto_integrations = true,
      float = {
        transparent = false,
        solid = false,
      },
      dim_inactive = {
        enabled = true,
        shade = "dark",
        percentage = 0.15,
      },
    })
    vim.cmd.colorscheme("catppuccin-mocha")
  end,
}
