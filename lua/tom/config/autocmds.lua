-- basic autocmds
local augroup = vim.api.nvim_create_augroup("UserConfig", {})

-- highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
	group = augroup,
	callback = function()
		vim.highlight.on_yank()
	end,
})

--command to set .vs and .fs files to glsl type (if you work with fsharp, .fs causes conflicts)
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	pattern = { "*.vs", "*.fs" },
	callback = function()
		vim.bo.filetype = "glsl"
	end,
})
