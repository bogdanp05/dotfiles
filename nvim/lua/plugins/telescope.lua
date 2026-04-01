local telescope_status, telescope = pcall(require, "telescope")
if not telescope_status then
	return
end

telescope.setup({
	defaults = {
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			"--hidden",
		},
		file_ignore_patterns = {
			"__pycache__",
			".venv",
			".mypy%-caches",
			".mypy_cache",
			".git/",
			".pytest_cache",
			"node_modules",
		},
	},
	pickers = {
		find_files = {
			hidden = true,
			no_ignore = true,
		},
	},
})

telescope.load_extension("fzf")
