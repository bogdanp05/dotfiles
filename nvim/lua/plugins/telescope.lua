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
			"node_modules",
		},
	},
	pickers = {
		find_files = {
			hidden = true,
			no_ignore = true,
		},
		live_grep = {
			---@diagnostic disable-next-line: unused-local
			additional_args = function(opts)
				return { "--hidden" }
			end,
		},
	},
})

telescope.load_extension("fzf")
