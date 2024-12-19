return {
   'stevearc/dressing.nvim',
   event = 'VeryLazy',
   opts = {
      input = {
         enabled = true,
         prompt_align = 'left',
         trim_prompt = 'true',
         insert_only = false,
         -- start_mode = 'insert',
         start_in_insert = true,
         border = 'rounded',
         relative = 'cursor',
         prefer_width = 0.4,
         mappings = {
            n = {
               ['<Esc>'] = 'Close',
               ['q'] = 'Close',
               ['<CR>'] = 'Confirm',
            },
            i = {
               ['<C-c>'] = 'Close',
               ['<CR>'] = 'Confirm',
               ['<Up>'] = 'HistoryPrev',
               ['<Down>'] = 'HistoryNext',
            },
         },
      },
      select = {
         enabled = true,
         backend = { 'telescope', 'builtin', 'fzf_lua', 'fzf', 'nui' },
         trim_prompt = true,
         builtin = {
            border = 'rounded',
            relative = 'cursor',
            mappings = {
               ['Esc'] = 'Close',
               ['q'] = 'Close',
               ['<CR>'] = 'Confirm',
            },
         },
      },
      nui = {
         win_options = {
            winblend = 0.7,
         },
      },
   },
}
