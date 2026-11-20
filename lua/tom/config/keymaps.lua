local keymap = vim.keymap
local opts = { noremap = true, silent = true }
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- do things without updating the registers
keymap.set("n", "x", '"_x')
keymap.set("n", "<Leader>p", '"0p')
keymap.set("n", "<Leader>P", '"0P')
keymap.set("v", "<Leader>p", '"0p')
keymap.set("n", "<Leader>c", '"_c')
keymap.set("n", "<Leader>C", '"_C')
keymap.set("v", "<Leader>c", '"_c')
keymap.set("v", "<Leader>C", '"_C')
keymap.set("n", "<Leader>d", '"_d')
keymap.set("n", "<Leader>D", '"_D')
keymap.set("v", "<Leader>d", '"_d')
keymap.set("v", "<Leader>D", '"_D')

-- delete a word backwards
keymap.set("n", "dw", 'vb"_d')

-- Move selected lines down in visual mode
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
-- Move selected lines up in visual mode
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Scroll half page down and center cursor
keymap.set("n", "<C-d>", "<C-d>zz")
-- Scroll half page up and center cursor
keymap.set("n", "<C-u>", "<C-u>zz")

-- Jump to next search result and center cursor
keymap.set("n", "n", "nzzzv")
-- Jump to previous search result and center cursor
keymap.set("n", "N", "Nzzzv")

-- Yank line to system clipboard
keymap.set("n", "<leader>y", '"+y')
-- Yank selection to system clipboard
keymap.set("v", "<leader>y", '"+y')
-- Yank to end of line to system clipboard
keymap.set("n", "<leader>Y", '"+Y')

-- Search and replace the word under the cursor in the whole file
keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- split windows
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- yank current file path
keymap.set("n", "<leader>yf", function()
	require("tom.utils.editor").yank_relative_path_with_line()
end, { desc = "Yank relative path with line number" })

keymap.set("n", "<leader>yp", function()
	require("tom.utils.editor").yank_absolute_path_with_line()
end, { desc = "Yank absolute path with line number" })

keymap.set("v", "<leader>cc", ":<C-u>lua require('craftzdog.utils.editor').copy_as_codeblock()<CR>")

-- Open a new Windows Terminal tab in the current directory
keymap.set("n", "<leader>wt", function()
	local cwd = vim.fn.getcwd()
	local cmd = string.format('wt -d "%s"', cwd)
	os.execute(cmd)
end, { desc = "Open a new Windows Terminal Tab" })

-- Open a new Windows Terminal tab with the VSPowerShell profile
keymap.set("n", "<leader>dt", function()
	local cwd = vim.fn.getcwd()
	local cmd = string.format('wt -d "%s" --profile "VSPowerShell"', cwd)
	os.execute(cmd)
end, { desc = "Open a new Visual Studio PowerShell Terminal Tab" })

-- Open a new Windows Terminal tab with the Ubuntu (WSL) profile
keymap.set("n", "<leader>lt", function()
	local cwd = vim.fn.getcwd()
	local cmd = string.format('wt -d "%s" --profile "Ubuntu"', cwd)
	os.execute(cmd)
end, { desc = "Open a new Visual Studio PowerShell Terminal Tab" })

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})

-- Toggle LSP inlay hints
keymap.set("n", "<leader>i", function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ 0 }), { 0 })
end)

-- Show diagnostics in a floating window
keymap.set("n", "<leader>e", function()
	vim.diagnostic.open_float(nil, {
		focus = false,
		border = "rounded",
		source = "always",
	})
end, { desc = "Show diagnostic in floating window" })
