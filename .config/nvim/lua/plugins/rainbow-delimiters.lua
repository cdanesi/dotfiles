return {
   'hiphish/rainbow-delimiters.nvim',
   event = { 'BufReadPre', 'BufNewFile' },
   main = 'rainbow-delimiters.setup',
   opts = {
      highlight = {
         'RainbowDelimiterCyan',
         'RainbowDelimiterBlue',
         'RainbowDelimiterGreen',
         'RainbowDelimiterViolet',
         'RainbowDelimiterYellow',
         'RainbowDelimiterRed',
         'RainbowDelimiterOrange',
      },
      query = {
         [''] = 'rainbow-delimiters',
         lua = 'rainbow-blocks',
         help = 'rainbow-blocks',
         query = function(bufnr)
            local is_nofile = vim.bo[bufnr].buftype == 'nofile'
            return is_nofile and 'rainbow-blocks' or 'rainbow-delimiters'
         end,
      },
   },
}
