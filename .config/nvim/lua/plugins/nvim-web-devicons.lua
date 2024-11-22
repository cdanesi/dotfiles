return {
  'nvim-tree/nvim-web-devicons',
  dependencies = {
    'rachartier/tiny-devicons-auto-colors.nvim',
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
      ['init.lua'] = {
        icon = '',
        name = 'nvim',
        color = '#a3be8c',
      },
    },
    override_by_extension = {
      ['log'] = {
        icon = '',
        color = '#81e043',
        name = 'Log',
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
