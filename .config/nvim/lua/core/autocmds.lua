local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local o = vim.opt_local

--  ──────────────────[ set options for markdown files ]───────────────
autocmd('FileType', {
   pattern = { 'markdown', 'telekasten' },
   callback = function()
      o.colorcolumn = '81'
      o.wrap = true
      o.linebreak = true
      o.breakindent = true
      o.textwidth = 80
      o.spell = true
      o.scrolloff = 999 -- center active line
   end,
})

--  ─────────────────────[ set options for gitcommit ]─────────────────────
autocmd('FileType', {
   pattern = 'gitcommit',
   callback = function()
      o.colorcolumn = '+1,+2'
      o.textwidth = 78
      o.spell = true
   end,
})

-- ┌
-- │ Highlight on yank
-- │ from https://github.com/raymon-roos/neovim-config/blob/main/lua/core/autocmds.lua
-- └
augroup('YankHighlight', { clear = true })
autocmd('TextYankPost', {
   group = 'YankHighlight',
   callback = function()
      vim.highlight.on_yank({ higroup = 'IncSearch', timeout = '800' })
   end,
})
