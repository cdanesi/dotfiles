return {
   'windwp/nvim-autopairs',
   config = true,
   event = { 'InsertEnter' },
   dependencies = {
      'hrsh7th/nvim-cmp',
   },
   opts = function(_, opts)
      local autopairs = require('nvim-autopairs.completion.cmp')
      local cmp = require('cmp')

      opts.fast_wrap = {}
      opts.check_ts = true
      opts.map_cr = true
      opts.map_bs = true
      opts.map_c_h = false
      opts.map_c_w = false

      cmp.event:on('confirm_done', autopairs.on_confirm_done())
   end,
}
