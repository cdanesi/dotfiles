return {
   'numToStr/Comment.nvim',
   dependencies = {
      'JoosepAlviste/nvim-ts-context-commentstring',
   },
   event = { 'BufReadPre', 'BufNewFile' },
   opts = {
      padding = true,
      sticky = true,
      toggler = {
         line = 'gcc',
         block = 'gbc',
      },
      opleader = {
         line = 'gc',
         block = 'gb',
      },
      extra = {
         -- Add comment on the line above
         above = 'gcO',
         -- Add comment on the line below
         below = 'gco',
         -- Add comment at the end of line
         eol = 'gcA',
      },
      mappings = {
         basic = true,
         extra = true,
      },
      pre_hook = function()
         require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook()
      end,
      post_hook = nil,
   },
}