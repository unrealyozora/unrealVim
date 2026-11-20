gh = function(x)
	return "https://github.com/" .. x
end

vim.pack.add({
	-- UI
	{ src = gh("catppuccin/nvim") },
	{ src = gh("nvim-mini/mini.icons") },
	{ src = gh("nvim-lualine/lualine.nvim") },
	{ src = gh("folke/snacks.nvim") },
	{ src = gh("b0o/incline.nvim") },
	{ src = gh("folke/trouble.nvim") },
	{ src = gh("esmuellert/codediff.nvim") },
	{ src = gh("rachartier/tiny-cmdline.nvim") },
	-- util
	{ src = gh("stevearc/oil.nvim") },
	{ src = gh("wsdjeg/rooter.nvim") },
	--editor
	{ src = gh("stevearc/conform.nvim") },
	{ src = gh("nvim-treesitter/nvim-treesitter") },
	{ src = gh("mks-h/treesitter-autoinstall.nvim") },
	{ src = gh("nvim-mini/mini.pairs") },
	{ src = gh("saghen/blink.cmp"), version = vim.version.range("^1") },
	{ src = gh("lewis6991/gitsigns.nvim") },
	{ src = gh("nvim-mini/mini.diff") },
	{ src = gh("tpope/vim-fugitive") },
	-- LSP
	{ src = gh("neovim/nvim-lspconfig") },
	{ src = gh("mason-org/mason.nvim") },
	{ src = gh("WhoIsSethDaniel/mason-tool-installer.nvim") },
})

require("tom.plugins.ui")
require("tom.plugins.treesitter")
require("tom.plugins.editor")
require("tom.plugins.lsp")
require("tom.plugins.util")
require("tom.plugins.keymaps")
