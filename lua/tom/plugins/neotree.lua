-- Neo-tree as a permanent left sidebar.
-- Files opened from the tree always land in the "main" window area, never in
-- the sidebar itself (see `open_files_in_last_window` below).

local M = {}

--- Is a neo-tree window visible in the current tab?
---@return boolean
local function sidebar_visible()
	for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
		if vim.bo[vim.api.nvim_win_get_buf(win)].filetype == "neo-tree" then
			return true
		end
	end
	return false
end

--- Open the sidebar without moving the cursor out of the current window.
function M.show()
	if sidebar_visible() then
		return
	end

	local origin = vim.api.nvim_get_current_win()
	require("neo-tree.command").execute({
		source = "filesystem",
		position = "left",
		action = "show", -- "show" instead of "focus": do not steal the cursor
	})
	if vim.api.nvim_win_is_valid(origin) then
		vim.api.nvim_set_current_win(origin)
	end
end

--- Open the sidebar and put the cursor inside it.
function M.focus()
	require("neo-tree.command").execute({
		source = "filesystem",
		position = "left",
		action = "focus",
	})
end

--- Close the sidebar if it is open, open it otherwise.
function M.toggle()
	if sidebar_visible() then
		require("neo-tree.command").execute({ position = "left", action = "close" })
	else
		M.focus()
	end
end

--- Don't pop the sidebar for special buffers (git commit messages, quickfix,
--- terminals, nofile buffers, ...).
---@return boolean
local function skip()
	return vim.bo.buftype ~= "" or vim.bo.filetype == "gitcommit" or vim.bo.filetype == "gitrebase"
end

local augroup = vim.api.nvim_create_augroup("UserNeoTree", {})

-- Always start with the sidebar, and give every new tab its own.
vim.api.nvim_create_autocmd("VimEnter", {
	group = augroup,
	callback = function()
		if not skip() then
			M.show()
		end
	end,
})

vim.api.nvim_create_autocmd("TabNewEntered", {
	group = augroup,
	callback = function()
		if not skip() then
			M.show()
		end
	end,
})

-- Lock the sidebar down: fixed width, no line numbers, no sign/gutter noise.
vim.api.nvim_create_autocmd("FileType", {
	group = augroup,
	pattern = "neo-tree",
	callback = function(args)
		local win = vim.api.nvim_get_current_win()
		if vim.api.nvim_win_get_buf(win) ~= args.buf then
			return
		end
		vim.wo[win].winfixwidth = true -- keep it put when other splits open/close
		vim.wo[win].number = false
		vim.wo[win].relativenumber = false
		vim.wo[win].signcolumn = "no"
		vim.wo[win].foldcolumn = "0"
		vim.wo[win].cursorline = true
	end,
})

require("neo-tree").setup({
	close_if_last_window = true, -- never close the sidebar on its own
	open_files_in_last_window = true, -- open files in the editor window, not in the sidebar
	-- never open a file *into* these windows either
	open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "edgy", "oil" },
	enable_git_status = true,
	enable_diagnostics = true,
	popup_border_style = "rounded",
	sort_case_insensitive = true,
	sources = { "filesystem", "buffers", "git_status" },
	source_selector = { winbar = false, statusline = false },
	default_component_configs = {
		indent = {
			with_expanders = true,
			expander_collapsed = "",
			expander_expanded = "",
		},
		git_status = {
			symbols = {
				added = "",
				modified = "",
				deleted = "✖",
				renamed = "󰁕",
				untracked = "",
				ignored = "◌",
				unstaged = "✗",
				staged = "✓",
				conflict = "",
			},
		},
	},
	window = {
		position = "left",
		width = 32,
		mappings = {
			["<cr>"] = "open",
			["<2-LeftMouse>"] = "open",
			["l"] = "open",
			["h"] = "close_node",
		},
	},
	filesystem = {
		hijack_netrw_behavior = "disabled", -- netrw is disabled in config/options.lua
		filtered_items = {
			hide_dotfiles = false,
			hide_gitignored = true, -- keeps node_modules & friends out of the tree
		},
		follow_current_file = { enabled = true, leave_dirs_open = false },
		group_empty_dirs = false,
		use_libuv_file_watcher = true, -- refresh on external changes
		window = {
			position = "left",
			width = 32,
			mappings = {
				["<cr>"] = "open",
				["<2-LeftMouse>"] = "open",
				["l"] = "open",
				["h"] = "close_node",
				["<bs>"] = "navigate_up",
			},
		},
	},
	buffers = {
		follow_current_file = { enabled = true, leave_dirs_open = false },
	},
})

return M
