local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
	return
end

-- config from nvim-tree docs
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

-- change color for arrows in tree to light blue
vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

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
					arrow_closed = "",
					arrow_open = "",
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
