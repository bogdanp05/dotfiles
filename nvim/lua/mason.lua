local mason_status, mason = pcall(require, "mason")
if not mason_status then
	return
end

local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
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
		"ts_ls",
		"vuels",
	},
	automatic_installation = true,
})
