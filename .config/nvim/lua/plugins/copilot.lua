return {
   'zbirenbaum/copilot.lua',
   dependencies = {
      'hrsh7th/nvim-cmp',
      -- 'zbirenbaum/copilot-cmp',
   },
   event = 'InsertEnter',

   opts = {
      no_tab_map = true,
      assume_mapped = true,
      suggestion = {
         enabled = true,
         auto_trigger = true,
         debounce = 75,
         keymap = {
            accept = '<C-J>',
            next = '<C-N>',
            prev = '<C-P>',
            dismiss = '<C-K>',
         },
         layout = {
            position = 'bottom',
            ratio = 0.4,
         },
      },
      panel = {
         enabled = true,
         auto_refresh = true,
         keymap = {
            jump_prev = '[[',
            jump_next = ']]',
            accept = '<CR>',
         },
      },
   },

   config = function(_, opts)
      require('copilot').setup(opts)
   end,
}
