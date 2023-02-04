local mason_status, mason = pcall(require, "mason")
if not mason_status then
	return
end

local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
	return
end

mason.setup()

mason_lspconfig.setup({
	-- The list of available keys: https://github.com/williamboman/mason-lspconfig.nvim
	ensure_installed = {
		"tsserver",
		"html",
		"cssls",
		"tailwindcss",
		"sumneko_lua",
		"pylsp",
		"terraformls",
	},
	automatic_installation = true,
})
