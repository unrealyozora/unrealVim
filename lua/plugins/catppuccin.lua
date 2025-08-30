return {
  "catppuccin/nvim",
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
    })
    vim.cmd.colorscheme("catppuccin-macchiato")
  end,
}
