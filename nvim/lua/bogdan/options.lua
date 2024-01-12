-- global vars
vim.g.python3_host_prog = "~/.local/bin/python3-aiven-fedora-37"

-- I don't like to type a lot
local opt = vim.opt

opt.guicursor = ""

-- line numbers
opt.nu = true
opt.relativenumber = false

-- tabs & indentation
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.incsearch = true
opt.smartindent = true

-- line wrapping
opt.wrap = false

-- search setttings
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.shortmess = opt.shortmess + "S"

-- appearence
opt.cursorline = true
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

--backspace
opt.backspace = "indent,eol,start"

--clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")
opt.autowrite = true
opt.autowriteall = true
opt.guicursor = "a:block,i-ci-ve:ver50,a:blinkwait300-blinkoff300-blinkon300-Cursor"
opt.spell = true
opt.spelllang = "en_us"

-- copilot stuff
vim.g.copilot_assume_mapped = true
