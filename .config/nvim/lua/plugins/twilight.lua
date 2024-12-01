return {
   'folke/twilight.nvim',
   lazy = true,
   opts = {
      context = 10,
      treesitter = true,
      expand = {
         'function',
         'method',
         'table',
         'if_statement',
      },
      exclude = {}, -- filetypes to exclude
   },
}
