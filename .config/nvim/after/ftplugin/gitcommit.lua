local o = vim.opt_local

o.textwidth = 78
o.spell = true

return {
   require('cmp').setup.buffer({
      sources = require('cmp').config.sources({ { name = 'gitmoji' } }, { { name = 'buffer' } }),
   }),
}
