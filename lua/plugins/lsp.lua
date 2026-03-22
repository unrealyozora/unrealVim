--Setup LSP, with lspconfig
return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },

    cond = not vim.g.vscode,

    dependencies = {
      -- Completion
      "saghen/blink.cmp",

      --Better and faster lua_ls setup
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

      --Border color setup
      vim.diagnostic.config({ virtual_text = { current_line = true } })
      vim.o.winborder = "single"

      -- Capabilities (blink.cmp)
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      -- Configure individual LSP servers
      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
        settings = {
          Lua = {
            hint = { enable = true },
          },
        },
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
          "gs",
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

      vim.lsp.config("vtls", {
        capabilities = capabilities,
      })
    end,
  },
}
