return {
   'RRethy/vim-illuminate',
   event = { 'BufReadPre', 'BufNewFile' },
   opts = {
      providers = {
         'nvim_lsp',
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
         'oil',
         'fugitive',
      },
      under_cursor = true,
      min_count_to_highlight = 1,
      case_insensitive_regex = false,
   },

   config = function(_, opts)
      require('illuminate').configure(opts)
   end,
}
