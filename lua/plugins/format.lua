return {
  {
    "stevearc/conform.nvim",
    cond = not vim.g.vscode,
    event = { "BufWritePre" },
    config = function()
      require("conform").setup({
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
          arduino = { "clang-format" },
          rust = { "rustfmt" },
          typescript = function(bufnr)
            if require("conform").get_formatter_info("biome", bufnr).available then
              return { "biome", lsp_format = "never" }
            end
          end,
          javascript = function(bufnr)
            if require("conform").get_formatter_info("biome", bufnr).available then
              return { "biome", lsp_format = "never" }
            end
          end,
          typescriptreact = function(bufnr)
            if require("conform").get_formatter_info("biome", bufnr).available then
              return { "biome", lsp_format = "never" }
            end
          end,
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
