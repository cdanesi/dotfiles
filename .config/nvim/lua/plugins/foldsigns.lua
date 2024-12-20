return {
   'yaocccc/nvim-foldsign',
   event = { 'BufReadPre', 'BufNewFile' },
   opts = {
      offset = -2,
      foldsigns = {
         open = '',
         close = '',
         seps = { '' },
      },
   },
}