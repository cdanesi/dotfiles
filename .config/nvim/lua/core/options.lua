vim.cmd "let g:netrw_liststyle = 3"

local opt = vim.opt

-- environment
opt.showmode = false

-- :cd shows cwd
opt.cdhome = false

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

-- line wrapping
opt.wrap = false

-- keep cursor line centered
opt.scrolloff = 999

-- search
opt.ignorecase = true
opt.smartcase = true
opt.iskeyword:append "-" -- consider string-string as a whole word

-- cursor line
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.colorcolumn = "80"
vim.diagnostic.config {
   float = {
      border = "rounded",
   },
}

-- virtualedit
opt.virtualedit = "block"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append "unnamedplus" -- use system clipboard as the default register

-- split windows
opt.splitright = true
opt.splitbelow = true

-- save me
opt.undodir = { os.getenv "HOME" .. "/.config/nvim/.undo/" }
opt.undofile = true

-- folding
opt.foldlevel = 20
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"

-- session management
opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
