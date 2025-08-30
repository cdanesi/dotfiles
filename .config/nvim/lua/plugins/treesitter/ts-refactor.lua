return {
   'nvim-treesitter/nvim-treesitter-refactor',
   event = { 'BufReadPre', 'BufNewFile' },
   dependencies = { 'nvim-treesitter/nvim-treesitter' },
   opts = {
      refactor = {
         highlight_definitions = {
            enable = true,
            clear_on_cursor_move = true, -- Set to false if you have an `updatetime` of ~100.
         },
         highlight_current_scope = {
            enable = false,
         },
         smart_rename = {
            enable = true,
            keymaps = {
               smart_rename = 'grr',
            },
         },
         navigation = {
            enable = true,
            keymaps = {
               goto_definition_lsp_fallback = 'gd',
               list_definitions = 'gnD',
               list_definitions_toc = 'gO',
               goto_next_usage = '<a-*>',
               goto_previous_usage = '<a-#>',
            },
         },
      },
   },
   config = function(_, opts)
      require('nvim-treesitter.configs').setup(opts)
   end,
}