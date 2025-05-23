local telescope_status, telescope = pcall(require, "telescope")
if not telescope_status then
	return
end

telescope.setup({
	defaults = {
		file_ignore_patterns = {
			"__pycache__",
			".venv",
			".mypy%-caches",
			".mypy_cache",
			".git/",
			".pytest_cache",
			".ruff_cache",
			"node_modules",
			"rpms/",
		},
	},
	pickers = {
		find_files = {
			hidden = true,
			no_ignore = true,
		},
		live_grep = {
			additional_args = { "--hidden" },
		},
	},
})

telescope.load_extension("fzf")
