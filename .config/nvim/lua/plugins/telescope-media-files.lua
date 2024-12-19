return {
   'nvim-telescope/telescope-media-files.nvim',
   dependencies = {
      'nvim-telescope/telescope.nvim',
      'nvim-lua/popup.nvim',
   },
   event = 'VeryLazy',

   config = function()
      local telescope = require('telescope')

      telescope.setup({
         extensions = {
            media_files = {
               find_cmd = 'rg',
            },
         },
      })

      telescope.load_extension('media_files')
   end,
}