vim.opt_local.textwidth = 78
vim.opt_local.spell = true

return {
   require('cmp').setup.buffer({
      sources = require('cmp').config.sources({ { name = 'gitmoji' } }, { { name = 'buffer' } }),
   }),
}