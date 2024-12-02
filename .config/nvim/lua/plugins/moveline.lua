return {
   'willothy/moveline.nvim',
   build = 'make',
   keys = {
      { '<M-[>', mode = 'n' },
      { '<M-]>', mode = 'n' },
      { '<M-[>', mode = 'v' },
      { '<M-]>', mode = 'v' },
   },

   config = function()
      local moveline = require('moveline')
      local map = vim.keymap

      map.set('n', '<M-[>', moveline.up)
      map.set('n', '<M-]>', moveline.down)
      map.set('v', '<M-[>', moveline.block_up)
      map.set('v', '<M-]>', moveline.block_down)
   end,
}
