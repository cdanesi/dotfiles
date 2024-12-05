return {
   'uga-rosa/ccc.nvim',
   event = 'VeryLazy',
   -- cmd = { 'CccPick', 'CccConvert', 'CccHighlighterToggle', 'CccHighlighterEnable', 'CccHighlighterDisable' },
   opts = {
      highlighter = {
         auto_enable = true,
         lsp = true,
         update_insert = true,
         filetypes = {
            'markdown',
            'javascript',
            'html',
            'css',
            'python',
            'json',
            'lua',
            'toml',
            'yaml',
            'asciidoc',
         },
         excludes = {
            --[[ 'lazy',
            'NvimTree',
            'alpha',
            'dashboard',
            'help',
            'man', ]]
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
