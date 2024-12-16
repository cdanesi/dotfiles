return {
   'nvim-tree/nvim-web-devicons',
   dependencies = {
      {
         'rachartier/tiny-devicons-auto-colors.nvim',
         opts = {
            cache = {
               enabled = true,
               path = vim.fn.stdpath('cache') .. '/tiny-devicons-auto-colors-cache.json',
            },
            precise_search = {
               enabled = true,
               iteration = 10,
               precision = 20,
               threshold = 23,
            },
            autoreload = true,
         },
      },
   },
   lazy = true,
   opts = {
      override = {
         zsh = {
            icon = '',
            color = '#428850',
            cterm_color = '65',
            name = 'Zsh',
         },
      },
      color_icons = true,
      variant = 'dark',
      override_by_filename = {
         ['.gitignore'] = {
            icon = '',
            color = '#f1502f',
            name = 'Gitignore',
         },
         ['nvim'] = {
            icon = '',
            name = 'nvim',
            color = '#a3be8c',
         },
         ['init.lua'] = {
            icon = '',
            name = 'nvim',
            color = '#a3be8c',
         },
         ['plugins'] = {
            icon = '',
         },
      },
      override_by_extension = {
         ['log'] = {
            icon = '',
            color = '#81e043',
            name = 'Log',
         },
         ['sh'] = {
            icon = '󱆃',
            name = 'bash',
         },
      },
      override_by_operating_system = {
         ['apple'] = {
            icon = '',
            color = '#A2AAAD',
            cterm_color = '248',
            name = 'Apple',
         },
      },
   },
}