vim.lsp.set_log_level("WARN")
vim.lsp.enable("clangd")
vim.lsp.enable("glsl_analyzer")
vim.lsp.enable("pyright")
vim.lsp.enable("gdscript")
return {
  {
    "neovim/nvim-lspconfig",
    cond = not vim.g.vscode,
    dependencies = {
      "saghen/blink.cmp",
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    config = function()
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          local opts = { buffer = ev.buf }
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
          vim.keymap.set("n", "ca", vim.lsp.buf.code_action)
        end,
      })
      local capabilities = require("blink.cmp").get_lsp_capabilities()
      require("lspconfig").lua_ls.setup({ capabilities = capabilities })
      vim.lsp.config("clangd", { cmd = { "clangd", "--enable-config" } })
      vim.lsp.config("glsl_analyzer", {
        capabilities = capabilities,
        filetypes = { "glsl", "vert", "tesc", "tese", "frag", "geom", "comp", "fs", "vs" },
      })
      vim.lsp.config("gdscript", {
        capabilities = capabilities,
      })
    end,
  },
}
