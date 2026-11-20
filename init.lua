if vim.loader then
	vim.loader.enable()
end


_G.Tom = require("tom.utils")
require("tom.config.options")
require("tom.config.keymaps")
require("tom.config.autocmds")
require("tom.plugins")


