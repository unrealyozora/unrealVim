vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

--vim.keymap.set("x", "p", '"_dP')

vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

vim.keymap.set("n", "<leader>d", '"_d')
vim.keymap.set("v", "<leader>d", '"_d')

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<leader>wt", function()
  local cwd = vim.fn.getcwd()
  local cmd = string.format('wt -d "%s"', cwd)
  os.execute(cmd)
end, { desc = "Open a new Windows Terminal Tab" })

vim.keymap.set("n", "<leader>dt", function()
  local cwd = vim.fn.getcwd()
  local cmd = string.format('wt -d "%s" --profile "VSPowerShell"', cwd)
  os.execute(cmd)
end, { desc = "Open a new Visual Studio PowerShell Terminal Tab" })

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})

vim.api.nvim_set_keymap("n", "d", '"_d', { noremap = true })
