-- lazy bootstrap
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
   vim.fn.system({
      'git',
      'clone',
      '--filter=blob:none',
      'https://github.com/folke/lazy.nvim.git',
      '--branch=stable',
      lazypath,
   })
end
vim.opt.rtp:prepend(lazypath)

-- lazy setup
require('lazy').setup({
   { import = 'core.colorscheme' },
   { import = 'plugins' },
   { import = 'plugins.treesitter' },
   { import = 'plugins.lsp' },
}, {
   install = {
      colorscheme = { 'nord' },
   },
   defaults = {
      lazy = true,
   },
   checker = {
      enabled = true,
      notify = false,
   },
   change_detection = {
      notify = false,
   },
})