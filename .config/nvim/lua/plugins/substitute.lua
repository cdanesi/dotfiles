return {
   'gbprod/substitute.nvim',
   event = { 'BufReadPre', 'BufNewFile' },
   opts = {
      highlight_substituted_text = {
         enabled = true,
         timer = 800,
      },
   },
}
