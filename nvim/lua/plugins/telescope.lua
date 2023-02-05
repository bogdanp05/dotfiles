local telescope_status, telescope = pcall("telescope")
if not telescope_status then
	return
end

local actions_status, actions = pcall("telescope.actions")
if not actions_status then
	return
end

telescope.setup({
	defaults = {
		file_ignore_patterns = {
			"__pycache__",
			".venv",
			".mypy_cache",
			".git/",
			".pytest_cache",
		},
	},
	pickers = {
		find_files = {
			no_ignore = true,
		},
	},
})

telescope.load_extension("fzf")
