return {
  {
    "mason-org/mason-lspconfig.nvim",
    cond = not vim.g.vscode,

    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
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
      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
      })
      vim.lsp.config("clangd", {
        cmd = { "clangd", "--enable-config" },
        capabilities = capabilities,
      })
      vim.lsp.config("glsl_analyzer", {
        capabilities = capabilities,
        filetypes = {
          "glsl",
          "vert",
          "tesc",
          "tese",
          "frag",
          "geom",
          "comp",
          "fs",
          "vs",
        },
      })

      vim.lsp.config("pyright", {
        capabilities = capabilities,
      })

      vim.lsp.config("gdscript", {
        capabilities = capabilities,
      })

      vim.lsp.config("rust_analyzer", {
        cmd = { "rust-analyzer" },
        capabilities = capabilities,
        filetypes = { "rust" },
        single_file_support = true,
      })

      vim.lsp.config("neocmake", {
        cmd = { "neocmakelsp", "stdio" },
        capabilities = capabilities,
      })
      for _, server in ipairs({
        "lua_ls",
        "clangd",
        "glsl_analyzer",
        "pyright",
        "gdscript",
        "rust_analyzer",
        "neocmake",
      }) do
        vim.lsp.enable(server)
      end
    end,
  },
}
