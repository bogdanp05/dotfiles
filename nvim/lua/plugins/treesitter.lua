local status_ok, nvim_treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

nvim_treesitter.setup({
	-- A list of parser names, or "all"
	ensure_installed = {
		"bash",
		"css",
		"dockerfile",
		"html",
		"go",
		"gitignore",
		"graphql",
		"hcl",
		"javascript",
		"json",
		"lua",
		"markdown",
		"python",
		"terraform",
		"typescript",
		"vim",
	},
	auto_install = true,
	sync_install = false,
	highlight = { enable = true },
	indent = { enable = true },
	autotag = { enable = true },
})
