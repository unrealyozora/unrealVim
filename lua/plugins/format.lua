return {
    {
        "stevearc/conform.nvim",
        cond = not vim.g.vscode,
        event = { "BufWritePre" },
        config = function()
            require("conform").setup({
                format_on_save = {
                    timeout_ms = 500,
                    lsp_fallback = true,
                },
                formatters_by_ft = {
                    lua = { "stylua" },
                    python = { "black" },
                    cpp = { "clang-format" },
                    c = { "clang-format" },
                },
            })
        end,
    },
}
