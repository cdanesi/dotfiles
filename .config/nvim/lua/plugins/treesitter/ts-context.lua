return {
   'nvim-treesitter/nvim-treesitter-context',
   dependencies = {
      'nvim-treesitter/nvim-treesitter',
   },
   event = { 'BufReadPost', 'BufNewFile' },
   config = true,
   opts = {
      enable = true,
      line_numbers = true,
      mode = 'topline',
      max_lines = 3,
      separator = '',
   },
}