return {
   -- does the same thing as git_files, but for yadm
   'pschmitt/telescope-yadm.nvim',
   dependencies = {
      'nvim-telescope/telescope.nvim',
   },
   enabled = true,
   event = 'VeryLazy',

   config = function(_, opts)
      local telescope = require('telescope')

      telescope.setup(opts)
      telescope.load_extension('yadm_files')
      telescope.load_extension('git_or_files')
      telescope.load_extension('git_or_yadm_files')
   end,
}
