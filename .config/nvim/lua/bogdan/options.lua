-- I don't like to type a lot
opt = vim.opt

opt.guicursor = ""

-- line numbers
opt.nu = true
opt.relativenumber = true

-- tabs & indentation
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.hlsearch = false
opt.incsearch = true
opt.smartindent = true

-- line wrapping
opt.wrap = false

-- search setttings
opt.ignorecase = true
opt.smartcase = true

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
