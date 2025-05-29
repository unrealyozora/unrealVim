require("config.lazy")
vim.g.have_nerd_font = true
require("tom")
require("lazy").setup({
	{ "nvim-treesitter/nvim-treesitter", branch = 'master', lazy = false, build = ":TSUpdate" }
})
vim.lsp.enable("luals")
