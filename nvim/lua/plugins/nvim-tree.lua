local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
	return
end

-- config from nvim-tree docs
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

nvimtree.setup({
	sort_by = "case_sensitive",
	open_on_tab = true,
	view = {
		adaptive_size = false,
		mappings = {
			list = {
				{ key = "-", action = "dir_up" },
			},
		},
	},
	renderer = {
		group_empty = true,
		icons = {
			glyphs = {
				folder = {
					-- arrow_closed = "",
					arrow_closed = "🡆",
					-- arrow_open = "",
					arrow_open = "🡇",
				},
			},
		},
	},
	filters = {
		dotfiles = false,
		custom = { "^.git$", "__pycache__", ".mypy_cache" },
	},
	git = {
		ignore = false,
	},
	actions = {
		change_dir = {
			restrict_above_cwd = true,
		},
	},
	update_focused_file = {
		enable = true,
	},
})

-- Open tree at startup: https://github.com/nvim-tree/nvim-tree.lua/wiki/Open-At-Startup
local function open_nvim_tree(data)
	-- buffer is a directory
	local directory = vim.fn.isdirectory(data.file) == 1

	if not directory then
		return
	end

	-- change to the directory
	vim.cmd.cd(data.file)

	-- change color for arrows in tree to light blue
	vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

	-- open the tree
	require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
