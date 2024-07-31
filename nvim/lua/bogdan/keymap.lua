vim.g.mapleader = " "

local keymap = vim.keymap

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle <CR>")

-- telescope
keymap.set("n", "<leader>ff", ":lua require('telescope.builtin').find_files()<CR>")
keymap.set("n", "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
keymap.set("n", "<leader>fs", ":lua require('telescope.builtin').grep_string()<CR>")
keymap.set("n", "<leader>fh", ":lua require('telescope.builtin').help_tags()<CR>")
keymap.set("n", "<leader>km", ":lua require('telescope.builtin').keymaps()<CR>")
keymap.set("n", "<leader>fr", ":lua require('telescope.builtin').resume()<CR>")
keymap.set("n", "<leader>pv", "<cmd>Ex<CR>")
keymap.set("n", "<leader>fr", ":lua require('telescope.builtin').lsp_references({ noremap = true, silent = true })<CR>")

-- harpoon
keymap.set("n", "<leader>pa", ":lua require('harpoon.mark').add_file()<CR>")
keymap.set("n", "<leader>pm", ":lua require('harpoon.ui').toggle_quick_menu()<CR>")

-- Position cursor to the middle of the screen when searching
keymap.set("n", "n", "nzz")
keymap.set("n", "N", "Nzz")
-- ...and when moving up and down half a page
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "<C-d>", "<C-d>zz")
-- ...and when jumping back in the code
keymap.set("n", "<C-o>", "<C-o>zz")

-- Use Tmux Navigator to move between windows
-- (no idea why this works for both <C-h> and <leader>h)
keymap.set("n", "<leader>h", "<cmd> TmuxNavigateLeft<CR>")
keymap.set("n", "<leader>l", "<cmd> TmuxNavigateRight<CR>")
keymap.set("n", "<leader>j", "<cmd> TmuxNavigateDown<CR>")
keymap.set("n", "<leader>k", "<cmd> TmuxNavigateUp<CR>")

keymap.set("n", "<leader>w", ":wincmd q<CR>")
keymap.set("n", "<leader><up>", ":resize +3<CR>")
keymap.set("n", "<leader><down>", ":resize -3<CR>")
keymap.set("n", "<leader><left>", ":vertical resize +3<CR>")
keymap.set("n", "<leader><right>", ":vertical resize -3<CR>")

-- Terminal --
keymap.set("n", "<leader>t", ":belowright 20sp term://zsh<CR>")
keymap.set("n", "<leader>vt", ":belowright 20vs term://zsh<CR> :resize 20<CR>")
keymap.set("n", "<Esc>", "<C-\\><C-n><CR>")

-- Default mappings to remember
-- Splits: <C-v> for vertical splits, <C-x> for horizontal splits

-- Copilot, https://github.com/orgs/community/discussions/29817#discussioncomment-4217615
keymap.set("i", "<C-f>", "copilot#Accept('<CR>')", { silent = true, expr = true, replace_keycodes = false })

-- Copy link to line in aiven repo core
-- keymap.set(
-- 	"n",
-- 	"<leader>gh",
-- 	":let @+=('https://github.com/aiven/aiven-core/blob/main/' . expand('%:h') . '/' . expand('%:t') . '#L' . line('.'))<CR>"
-- )
-- Copy link to line in any GitHub repo
keymap.set("n", "<leader>gh", ":.GBrowse!<CR>")
