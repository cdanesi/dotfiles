return {
   'RRethy/vim-illuminate',
   event = { 'BufReadPre', 'BufNewFile' },
   opts = {
      providers = {
         'lsp',
         'treesitter',
         'regex',
      },
      delay = 100,
      filetypes_denylist = {
         'NvimTree',
         'help',
         'man',
         'markdown',
         'md',
      },
      under_cursor = true,
      min_count_to_highlight = 1,
      case_insensitive_regex = false,
   },

   config = function(_, opts)
      require('illuminate').configure(opts)
   end,
}
