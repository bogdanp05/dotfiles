local mason_status, mason = pcall(require, "mason")
if not mason_status then
	return
end

local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
	return
end

local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
	return
end

mason.setup({
	-- I want to use env binaries if they exist; otherwise mason binaries. This is for black and mypy
	PATH = "append",
})

mason_lspconfig.setup({
	-- The list of available keys: https://github.com/williamboman/mason-lspconfig.nvim
	ensure_installed = {
		"clangd",
		"cssls",
		"gopls",
		"html",
		"lua_ls",
		"pyright",
		"rust_analyzer",
		"tailwindcss",
		"terraformls",
		"tsserver",
		"vuels",
	},
	automatic_installation = true,
})

mason_null_ls.setup({
	-- list of formatters & linters for mason to install
	ensure_installed = {
		"black",
		"flake8",
		"isort",
		"jq",
		"mypy",
		"rustfmt",
		"stylua",
	},
	-- auto-install configured formatters & linters (with null-ls)
	automatic_installation = true,
})
