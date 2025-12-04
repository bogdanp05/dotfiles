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
vim.lsp.config.html = {
	capabilities = capabilities,
	on_attach = on_attach,
}

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
vim.lsp.config.ts_ls = {
	server = {
		capabilities = capabilities,
		on_attach = on_attach,
	},
}

-- configure css server
vim.lsp.config.cssls = {
	capabilities = capabilities,
	on_attach = on_attach,
}

-- configure tailwindcss server
vim.lsp.config.tailwindcss ={
	capabilities = capabilities,
	on_attach = on_attach,
}

-- configure lua server (with special settings)
vim.lsp.config.lua_ls = {
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
}

-- configure python server
vim.lsp.config.pyright = {
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		python = {
			analysis = {
				-- I want to use mypy type checker, not pyright's
				typeCheckingMode = "off",
			},
		},
	},
}

-- configure terraform server
vim.lsp.config.terraformls = {
	capabilities = capabilities,
	on_attach = on_attach,
}

-- configure Vue server
vim.lsp.config.vuels = {
	capabilities = capabilities,
	on_attach = on_attach,
}

-- configure Go server
vim.lsp.config.gopls = {
	capabilities = capabilities,
	on_attach = on_attach,
}

-- configure Rust server
vim.lsp.config.rust_analyzer = {
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = { "rust" },
}

-- configure C server
vim.lsp.config.clangd = {
	capabilities = capabilities,
	on_attach = on_attach,
}

-- configure SQL server
vim.lsp.config.sqls = {
	capabilities = capabilities,
	on_attach = on_attach,
}

vim.lsp.enable({
    "clangd",
    "cssls",
    "gopls",
    "html",
    "lua_ls",
    "pyright",
    "rust_analyzer",
    "sqls",
    "tailwindcss",
    "terraformls",
    "ts_ls",
    "vuels",
})
