return {
   'nvim-treesitter/nvim-treesitter-context',
   enabled = false,
   dependencies = {
      'nvim-treesitter/nvim-treesitter',
   },
   event = { 'BufReadPost', 'BufNewFile' },
   config = true,
   opts = {
      enable = true,
      mode = 'cursor',
      max_lines = 3,
      -- separator = '',
   },
}
