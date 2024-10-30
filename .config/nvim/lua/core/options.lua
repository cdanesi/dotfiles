local opt = vim.opt

-- line numbers
opt.number = true
opt.relativenumber = true

-- tabs & indents
opt.tabstop = 3
opt.softtabstop = 3
opt.shiftwidth = 3
opt.expandtab = true
opt.smartindent = true
opt.autoindent = true

-- disable line wrapping
opt.wrap = false

-- search
opt.ignorecase = true
opt.smartcase = true
opt.iskeyword:append("-") -- consider string-string as a whole word

-- cursor line
opt.cursorline = true

-- appearance
opt.termguicolors = false
opt.background = "dark"
opt.signcolumn = "yes"
opt.colorcolumn = "90"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as the default register

-- split windows
opt.splitright = true
opt.splitbelow = true

-- save me
opt.undodir = os.getenv("HOME") .. "/.config/nvim/.undo"
opt.undofile = true
