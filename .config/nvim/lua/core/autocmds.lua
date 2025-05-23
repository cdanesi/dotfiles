local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local o = vim.opt_local

--  ──────────────────[ set options for markdown files ]───────────────
autocmd('FileType', {
   pattern = 'markdown',
   callback = function()
      o.colorcolumn = '+1,+2'
      o.textwidth = 80
      o.spell = true
   end,
})

--[[ --  ─────────────────────[ set options for gitcommit ]─────────────────────
autocmd('FileType', {
   pattern = 'gitcommit',
   callback = function()
      vim.opt_local.textwidth = 78
      vim.opt_local.spell = true
   end,
}) ]]

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
