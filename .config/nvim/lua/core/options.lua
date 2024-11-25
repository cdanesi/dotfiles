local o = vim.opt
local g = vim.g

-- environment
o.showmode = false
g.netrw_liststyle = 3
g.netrw_banner = 0

-- :cd shows cwd
o.cdhome = false

-- line numbers
o.number = true
o.relativenumber = true

-- tabs & indents
o.tabstop = 3
o.softtabstop = 3
o.shiftwidth = 3
o.expandtab = true
o.smartindent = true
o.autoindent = true

-- line wrapping
o.wrap = false
o.breakindent = true

-- keep cursor line centered
o.scrolloff = 999

-- search
o.ignorecase = true
o.smartcase = true
o.iskeyword:append('-') -- consider string-string as a whole word

-- cursor line
o.cursorline = true

-- appearance
o.termguicolors = true
o.background = 'dark'
o.signcolumn = 'yes'
o.colorcolumn = '80'
vim.diagnostic.config({
  float = {
    border = 'rounded',
  },
})

-- virtualedit
o.virtualedit = 'block'

-- backspace
o.backspace = 'indent,eol,start'

-- clipboard
o.clipboard:append('unnamedplus') -- use system clipboard as the default register

-- split windows
o.splitright = true
o.splitbelow = true

-- save me
-- o.undodir = { os.getenv("HOME") .. "/.undo/" }
-- set undo dir under nvim app folder
-- o.undodir = { vim.fn.stdpath('config') .. '/.undo/' }
-- undodir is in .local/state/nvim/undo (default)
o.undodir = { vim.fn.stdpath('state') .. '/undo/' }
o.undofile = true

-- folding
o.foldcolumn = '0'
o.foldlevel = 5
o.foldmethod = 'expr'
o.foldexpr = 'nvim_treesitter#foldexpr()'
o.fillchars = {
  foldopen = '',
  foldclose = '',
  fold = ' ',
  foldsep = ' ',
  eob = ' ',
}

-- session management
o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'
