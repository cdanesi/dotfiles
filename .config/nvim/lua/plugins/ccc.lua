return {
   'uga-rosa/ccc.nvim',
   ft = {
      'markdown',
      'javascript',
      'html',
      'css',
      'python',
      'json',
      'lua',
      'toml',
      'yaml',
   },
   cmd = { 'CccPick', 'CccConvert', 'CccHighlighterToggle', 'CccHighlighterEnable', 'CccHighlighterDisable' },
   opts = {
      highlighter = {
         auto_enable = true,
         lsp = true,
         update_insert = true,
         excludes = {
            'NvimTree',
            'alpha',
            'dashboard',
            'help',
            'man',
         },
      },
      recognize = {
         input = true,
         output = true,
      },
      highlight_mode = 'virtual',
      preserve = true,
      lsp = true,
      --[[ pickers = {
         require('ccc').picker.ansi_escape(),
      }, ]]
   },

   config = function(_, opts)
      local ccc = require('ccc')
      ccc.setup(opts)
   end,
}