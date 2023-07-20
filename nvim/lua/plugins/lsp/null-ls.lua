local setup, null_ls = pcall(require, "null-ls")
if not setup then
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

-- You gotta have these formatters available on your path. You can validate this by running e.g.
-- :echo executable('black')

local sources = {
	-- JSON
	formatting.jq,
	-- Lua
	formatting.stylua,
	-- Python
	formatting.black,
	formatting.isort,
	diagnostics.flake8,
	diagnostics.mypy,
}

-- Set up auto formatting on save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local on_attach = function(client, bufnr)
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.format({ bufnr = bufnr })
			end,
		})
	end
end

null_ls.setup({
	sources = sources,
	on_attach = on_attach,
	diagnostics_format = "[#{c}] #{m} (#{s})",
	should_attach = function(bufnr)
		-- I don't want null-ls to attach in my virtual env nor in python packages
        -- '%' works for escaping special chars in Lua, which '-' is. So dumb.
		return not vim.api.nvim_buf_get_name(bufnr):match("venv/lib/")
			and not vim.api.nvim_buf_get_name(bufnr):match("/usr/lib/python3.11/site%-packages/")
	end,
})
