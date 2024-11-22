local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
	return
end

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
	return
end

local keymap = vim.keymap

-- enable keybinds only for when LSP server available
local on_attach = function(client, bufnr)
	-- keybind options
	local opts = { noremap = true, silent = true, buffer = bufnr }

	-- set keybinds
	-- keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts) -- show definition, references
	keymap.set("n", "gf", "<cmd>lua vim.lsp.buf.references()<CR>", opts) -- references
	keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.definition()<CR>", opts) -- got to declaration
	keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
	keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
	keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
	keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
	keymap.set("n", "<leader>d", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
	keymap.set("n", "<leader>D", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
	keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
	keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
	keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
	keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts) -- see outline on right hand side
	keymap.set("n", "<leader>gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)

	-- typescript specific keymaps (e.g. rename file and update imports)
	if client.name == "ts_ls" then
		keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>") -- rename file and update imports
		keymap.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>") -- organize imports (not in youtube nvim video)
		keymap.set("n", "<leader>ru", ":TypescriptRemoveUnused<CR>") -- remove unused variables (not in youtube nvim video)
	end
end

-- used to enable autocompletion (assign to every lsp server config)
local capabilities = cmp_nvim_lsp.default_capabilities()

-- Change the Diagnostic symbols in the sign column (gutter)
-- (not in youtube nvim video)
local signs = { Error = " ", Warn = " ", Hint = "💡", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- configure html server
lspconfig["html"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- https://github.com/LunarVim/LunarVim/discussions/4239#discussioncomment-6223638
local function filter_ts_ls_diagnostics(_, result, ctx, config)
	if result.diagnostics == nil then
		return
	end
	-- ignore some tsserver diagnostics
	local idx = 1
	while idx <= #result.diagnostics do
		local entry = result.diagnostics[idx]
		-- codes: https://github.com/microsoft/TypeScript/blob/main/src/compiler/diagnosticMessages.json
		if entry.code == 80001 then
			-- { message = "File is a CommonJS module; it may be converted to an ES module.", }
			table.remove(result.diagnostics, idx)
		else
			idx = idx + 1
		end
	end
	vim.lsp.diagnostic.on_publish_diagnostics(_, result, ctx, config)
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = filter_ts_ls_diagnostics

-- configure typescript server with plugin
lspconfig["ts_ls"].setup({
	server = {
		capabilities = capabilities,
		on_attach = on_attach,
	},
})

-- configure css server
lspconfig["cssls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- configure tailwindcss server
lspconfig["tailwindcss"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- configure lua server (with special settings)
lspconfig["lua_ls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		-- custom settings for lua
		Lua = {
			-- make the language server recognize "vim" global
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				-- make language server aware of runtime files
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
})

-- configure python server
lspconfig["pyright"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		python = {
			analysis = {
				-- I want to use mypy type checker, not pyright's
				typeCheckingMode = "off",
				-- Make avn.* available
				extraPaths = {
					"py/import2rpm/src",
					"py/avnpkg/src",
					"py/initiator/src",
					"py/phantom/src",
					"py/undefined/src",
					"py/xxhash/src",
					"py/schemas/src",
					"py/secrets/src",
					"py/atomic-write/src",
					"py/datetime/src",
					"py/json-io/src",
					"py/json/src",
					"py/backoff/src",
					"py/logging/src",
					"py/models/src",
					"py/redact/src",
					"py/url/src",
					"py/enum/src",
					"py/pg-connection/src",
					"py/systemd/src",
					"py/stats-client/src",
					"py/encryption/src",
					"py/trace-id/src",
					"py/buildkite-artifacts/src",
					"py/cloudflare/src",
					"py/deps-bootstrap/src",
					"py/deps-report/src",
					"py/dg/src",
					"py/disk-usage/src",
					"py/project-selector/src",
					"py/project/src",
					"py/reposit/src",
					"py/test-tools/src",
					"py/units/src",
					"py/rapu/src",
					"py/schemas-derive/src",
					"py/test-java/src",
					"py/test-zookeeper/src",
					"py/daemon/src",
				},
			},
		},
	},
})

-- configure terraform server
lspconfig["terraformls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- configure Vue server
lspconfig["vuels"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- configure Go server
lspconfig["gopls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- configure Rust server
lspconfig["rust_analyzer"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = { "rust" },
})

-- configure C server
lspconfig["clangd"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- configure SQL server
lspconfig["sqls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
