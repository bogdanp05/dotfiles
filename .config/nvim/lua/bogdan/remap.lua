vim.g.mapleader = " "

local keymap = vim.keymap

-- general keymaps
keymap.set("n", "x", "_x")

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle <CR>")

local nnoremap = require("bogdan.keymap").nnoremap
local tnoremap = require("bogdan.keymap").tnoremap

local function map(mode, combo, mapping, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, combo, mapping, options)
end

nnoremap("<leader>pv", "<cmd>Ex<CR>")

-- Reload configuration without restart nvim
map("n", "<leader>r", ":so %<CR>")
-- Write buffer
nnoremap("<leader>s", ":w <CR>")
-- Position cursor to the middle of the screen when searching
nnoremap("n", "nzz")
nnoremap("N", "Nzz")
-- ...and when moving up and down half a page
nnoremap("<C-u>", "<C-u>zz")
nnoremap("<C-d>", "<C-d>zz")
-- ...and when jumping back in the code
nnoremap("<C-o>", "<C-o>zz")

-- Use Cmd + V to copy: https://github.com/neovim/neovim/issues/5052
map("v", "<M-c>", '"+y')

-- Control window --
nnoremap("<leader>h", ":wincmd h<CR>")
nnoremap("<leader>l", ":wincmd l<CR>")
nnoremap("<leader>j", ":wincmd j<CR>")
nnoremap("<leader>k", ":wincmd k<CR>")
nnoremap("<leader>w", ":wincmd q<CR>")
nnoremap("<leader><up>", ":resize +3<CR>")
nnoremap("<leader><down>", ":resize -3<CR>")
nnoremap("<leader><left>", ":vertical resize +3<CR>")
nnoremap("<leader><right>", ":vertical resize -3<CR>")

-- Terminal --
nnoremap("<leader>t", ":belowright 20sp term://zsh<CR>")
nnoremap("<leader>vt", ":belowright 20vs term://zsh<CR> :resize 20<CR>")
tnoremap("<Esc>", "<C-\\><C-n><CR>")

-- Telescope
map("", "<leader>ps", ":lua require('telescope.builtin').grep_string({ search = vim.fn.input('Grep For >')})<CR>")
map("", "<leader>ff", ":lua require('telescope.builtin').find_files({hidden=true})<CR>")
map("", "<leader>fg", ":lua require('telescope.builtin').live_grep()<CR>")
map("", "<leader>fh", ":lua require('telescope.builtin').help_tags()<CR>")
map("", "<leader>km", ":lua require('telescope.builtin').keymaps()<CR>")
map("", "<leader>fr", ":lua require('telescope.builtin').resume()<CR>")

-- Default mappings to remember
-- Splits: <C-v> for vertical splits, <C-x> for horizontal splits
