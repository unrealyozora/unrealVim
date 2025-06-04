local builtin = require('telescope.builtin')
local multigrep = require("config.telescope.multigrep")
vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope find help pages' })
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Telescope find git files' })
vim.keymap.set('n', '<leader>ps', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
vim.keymap.set('n', '<leader>fg', multigrep.live_multigrep, { desc = 'Telescope find with multigrep' })
