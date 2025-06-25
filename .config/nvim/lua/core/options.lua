--  ──────────────────────────────────────────────────────── helpers ──
local o = vim.opt
local g = vim.g
--  ──────────────────────────────────────────────────── environment ──
g.netrw_liststyle = 3
g.netrw_banner = 0
o.clipboard:append('unnamedplus') -- use system clipboard as the default register
o.cdhome = false                  -- :cd shows cwd
o.backspace = 'indent,eol,start'
o.spelllang = 'en_us'
--  ───────────────────────────────────────────────────── appearance ──
o.showmode = false
o.termguicolors = true
o.background = 'dark'
vim.diagnostic.config({
   float = {
      border = 'rounded',
   },
})
--  ─────────────────────────────────────────────────── line numbers ──
o.number = true
o.relativenumber = true
--  ──────────────────────────────────────────────────── sign column ──
o.signcolumn = 'yes'
--  ──────────────────────────────────────────────────── cursor line ──
o.cursorline = true
-- o.scrolloff = 999 -- keep cursor line centered
--  ───────────────────────────────────────────────── tabs & indents ──
o.tabstop = 3
o.softtabstop = 3
o.shiftwidth = 3
o.expandtab = true
o.smartindent = true
o.autoindent = true
--  ────────────────────────────────────────────────── line wrapping ──
o.wrap = false
o.breakindent = true
-- o.textwidth = 0
o.wrapmargin = 10
--  ──────────────────────────────────────────────────────── conceal ──
o.conceallevel = 2
--  ──────────────────────────────────────────────────────── folding ──
o.foldcolumn = '0'
o.foldlevel = 15
o.foldmethod = 'expr'
o.foldexpr = 'nvim_treesitter#foldexpr()'
o.fillchars = {
   foldopen = '',
   foldclose = '',
   fold = ' ',
   foldsep = ' ',
   eob = ' ',
}
--  ──────────────────────────────────────────────────── virtualedit ──
o.virtualedit = 'block'
--  ─────────────────────────────────────────────────────────── undo ──
o.undolevels = 10000
o.undofile = true
--  ───────────────────────────────────────────── session management ──
-- ┌
-- │ can not include 'globals' or it breaks auto-session
-- │ because NvimTree
-- │ adds 2 variables to session file that prevents
-- │ NvimTree from working
-- │ after session is restored.
-- └
o.sessionoptions = 'globals,buffers,curdir,folds,localoptions,help,tabpages,terminal,winsize,winpos'
--  ────────────────────────────────────────────────── split windows ──
o.splitright = true
o.splitbelow = true
--  ───────────────────────────────────────────────────────── search ──
o.ignorecase = true
o.smartcase = true
o.iskeyword:append('-') -- consider string-string as a whole word
--  ───────────────────────────────────────────────────── completion ──
o.completeopt = 'menu,preview,noselect'