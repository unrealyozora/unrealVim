-- =====================================================================
--  LSP CONFIG (Neovim 0.10+ API + nvim-lspconfig + mason + blink.cmp)
-- =====================================================================

vim.lsp.set_log_level("WARN")

local util = require("lspconfig.util")
local configs = require("lspconfig.configs")
local lspconfig = require("lspconfig")

-- --------------------------------------------------
--  EXPORT PLUGIN SPEC FOR lazy.nvim
-- --------------------------------------------------

return {
  {
    "neovim/nvim-lspconfig",
    cond = not vim.g.vscode,

    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      { "mason-org/mason-lspconfig.nvim" },
      "WhoIsSethDaniel/mason-tool-installer.nvim",

      "nvim-java/nvim-java",

      -- Completion
      "saghen/blink.cmp",

      {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
          library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },

    config = function()
      -- Attach keymaps
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspKeymaps", {}),
        callback = function(ev)
          local opts = { buffer = ev.buf }
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
          vim.keymap.set("n", "ca", vim.lsp.buf.code_action, opts)
        end,
      })

      -- Capabilities (blink.cmp)
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      -- --------------------------------------------------
      --  CONFIGURE BUILT-IN LSP SERVERS
      -- --------------------------------------------------

      vim.lsp.enable("lua_ls")
      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
      })

      vim.lsp.enable("clangd")
      vim.lsp.config("clangd", {
        cmd = { "clangd", "--enable-config" },
        capabilities = capabilities,
      })

      vim.lsp.enable("glsl_analyzer")
      vim.lsp.config("glsl_analyzer", {
        capabilities = capabilities,
        filetypes = { "glsl", "vert", "tesc", "tese", "frag", "geom", "comp", "fs", "vs" },
      })

      vim.lsp.enable("pyright")
      vim.lsp.enable("gdscript")

      vim.lsp.enable("rust_analyzer")
      vim.lsp.config("rust_analyzer", {
        cmd = { "rust-analyzer" },
        capabilities = capabilities,
        filetypes = { "rust" },
        root_markers = { "Cargo.toml", ".git" },
        single_file_support = true,
      })

      local phpactor_cmd = { "wsl", "-e", "bash", "-ic", "/home/tomma/.local/bin/phpactor" }
      lspconfig.phpactor.setup({
        cmd = phpactor_cmd,
        capabilities = capabilities,
        filetypes = { "php" },
        root_dir = function(fname)
          local dir = util.root_pattern("composer.json", ".git")(fname)
          if dir then
            return dir
          end
          return vim.fs.dirname(fname)
        end,
      })

      -- --------------------------------------------------
      --  JAVA
      -- --------------------------------------------------

      require("java").setup({})
      lspconfig.jdtls.setup({})
    end,
  },
}
