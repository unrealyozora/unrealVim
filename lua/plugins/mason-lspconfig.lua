-- This helps installing lsps and formatters with Mason
-- IMPORTANT!: Setup Mason and nvim-lspconfig before setting up mason-lspconfig
return {
  "mason-org/mason-lspconfig.nvim",

  cond = not vim.g.vscode,

  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    "neovim/nvim-lspconfig",

    --Advanced tool manager for additional tools (like formatters and linters)
    {
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      opts = {
        ensure_installed = {
          "clang-format",
          "stylua",
          "black",
          "rustfmt",
        },
        auto_update = true,
      },
    },
  },

  opts = {
    -- Servers we want to make sure are installed
    ensure_installed = {
      "lua_ls",
      "clangd",
      "glsl_analyzer",
      "pyright",
      "rust_analyzer",
      "neocmake",
    },
    -- Automatically install missing servers from "ensure_installed" list
    automatic_installation = true,
  },
}
