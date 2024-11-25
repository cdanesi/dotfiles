return {
   'stevearc/dressing.nvim',
   dependencies = {
      'nvim-telescope/telescope.nvim',
   },
   event = 'VeryLazy',
   opts = {
      input = {
         enabled = true,
         -- default_prompt = 'Prompt',
         prompt_align = 'left',
         insert_only = false,
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
         override = function(conf)
            return conf
         end,
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
         override = function(conf)
            return conf
         end,
      },
   },
}