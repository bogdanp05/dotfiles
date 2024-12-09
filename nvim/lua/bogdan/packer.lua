-- Auto install packer if not installed
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- Autocommand that reloads Neovim and installs/updates/removes plugins when the file is saved
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
	return
end

-- add list of plugins to install
return packer.startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- Colorscheme
	use("bluz71/vim-nightfly-guicolors")

	-- Comments
	use("numToStr/Comment.nvim")

	-- Lua functions for other plugins
	use("nvim-lua/plenary.nvim")

	-- Tree for explorer view
	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
		tag = "v1.9", -- optional, updated every week. (see issue #1193)
	})

	-- Status line
	use("nvim-lualine/lualine.nvim")

	-- Fuzzy finding w/ telescope
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
	use({
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		requires = { { "nvim-telescope/telescope-live-grep-args.nvim" } },
		config = function()
			require("telescope").load_extension("live_grep_args") -- fuzzy finder
		end,
	})

	-- Autocompletion
	use("hrsh7th/nvim-cmp") -- completion plugin
	use("hrsh7th/cmp-buffer") -- source for text in buffer
	use("hrsh7th/cmp-path") -- source for file system paths

	-- Snippets
	use("L3MON4D3/LuaSnip") -- snippet engine
	use("saadparwaiz1/cmp_luasnip") -- for autocompletion

	-- Managing and installing LSP servers, linters, and formatters
	use("williamboman/mason.nvim") -- in charge of managing LSP servers, linters & formatters
	use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig

	-- Configuring lsp servers
	use("neovim/nvim-lspconfig") -- easily configure language servers
	use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
	use({ "glepnir/lspsaga.nvim", branch = "main" }) -- enhanced lsp uis
	use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
	use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion

	-- Formatting & linting
	use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
	use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

	-- Treesitter for syntax highlighting
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	-- use("nvim-treesitter/nvim-treesitter-context")

	-- Auto closing stuff
	use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

	-- git integration
	use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side
	use("tpope/vim-fugitive") -- git commands in nvim
	use("tpope/vim-rhubarb") -- enable GBrowse in fugitive

	-- Variable highlighting
	use("RRethy/vim-illuminate")

	-- Markdown preview
	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})

	-- Navigate between nvim and tmux
	use({
		"christoomey/vim-tmux-navigator",
		lazy = false,
	})

	-- Harpoon for quicker file navigation
	use("ThePrimeagen/harpoon")

	-- Github Copilot
	use("github/copilot.vim")
end)
