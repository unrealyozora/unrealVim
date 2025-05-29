return {
    {
        "ThePrimeagen/harpoon",
        cond = not vim.g.vscode,
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" }
    }
}
