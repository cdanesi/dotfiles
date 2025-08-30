return {
   'nvim-telescope/telescope.nvim',
   branch = '0.1.x',
   dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      'folke/todo-comments.nvim',
      'pschmitt/telescope-yadm.nvim',
      { 'cdanesi/telescope-media-files.nvim', dependencies = 'nvim-lua/popup.nvim' },
   },
   event = 'VeryLazy',
   config = function()
      local telescope = require('telescope')
      local actions = require('telescope.actions')
      local transform_mod = require('telescope.actions.mt').transform_mod
      local trouble = require('trouble')
      local trouble_telescope = require('trouble.sources.telescope')

      local custom_actions = transform_mod({
         open_trouble_qflist = function(prompt_bufnr)
            trouble.toggle('quickfix')
         end,
      })

      telescope.setup({
         defaults = {
            path_display = { 'smart' },
            mappings = {
               n = {
                  ['x'] = actions.delete_buffer,
                  ['q'] = actions.close,
               },
               i = {
                  ['<C-k>'] = actions.move_selection_previous,
                  ['<C-j>'] = actions.move_selection_next,
                  ['<C-q>'] = actions.send_selected_to_qflist + custom_actions.open_trouble_qflist,
                  ['<C-t>'] = trouble_telescope.open,
                  ['<ESC>'] = actions.close,
               },
            },
         },
         pickers = {
            buffers = {
               theme = 'dropdown',
               sort_mru = true,
               sort_lastused = true,
               show_all_buffers = true,
            },
            help_tags = {
               theme = 'ivy',
            },
         },
         extensions = {
            fzf = {},
            media_files = {
               find_cmd = 'rg',
            },
         },
      })

      telescope.load_extension('fzf')
      telescope.load_extension('media_files')
      telescope.load_extension('yadm_files')
      telescope.load_extension('git_or_files')
      telescope.load_extension('git_or_yadm_files')
   end,
}