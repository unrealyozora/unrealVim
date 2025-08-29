return {
  {
    "stevearc/conform.nvim",
    cond = not vim.g.vscode,
    event = { "BufWritePre" },
    config = function()
      require("conform").setup({
        log_level = vim.log.levels.DEBUG,
        format_on_save = {
          timeout_ms = 500,
          lsp_format = "fallback",
        },
        formatters_by_ft = {
          lua = { "stylua" },
          python = { "black" },
          cpp = { "clang-format" },
          c = { "clang-format" },
          gdscript = { "gdformat" },
        },
        formatters = {
          gdformat = {
            command = "gdformat",
            args = { "$FILENAME" },
            stdin = false,
          },
        },
      })
    end,
  },
}
