return {
   'lewis6991/gitsigns.nvim',
   dependencies = {
      'nvim-lua/plenary.nvim',
      {
         'purarue/gitsigns-yadm.nvim',
         opts = {
            shell_timeout_ms = 1000,
         },
      },
   },
   event = { 'BufEnter' },
   opts = {
      _on_attach_pre = function(bufnr, callback)
         require("gitsigns-yadm").yadm_signs(callback, { bufnr = bufnr })
      end,
      signs = {
         add = { text = '+' },
         change = { text = '┃' },
         delete = { text = '_' },
         topdelete = { text = '‾' },
         changedelete = { text = '~' },
         untracked = { text = '┆' },
      },
      signs_staged = {
         add = { text = '+' },
         change = { text = '┃' },
         delete = { text = '_' },
         topdelete = { text = '‾' },
         changedelete = { text = '~' },
         untracked = { text = '┆' },
      },
      signs_staged_enable = true,
      signcolumn = true,
      numhl = true,
      linehl = false,
      word_diff = false,
      trouble = true,
      watch_gitdir = {
         interval = 1000,
         follow_files = true,
      },
      attach_to_untracked = false,
      current_line_blame = true,
      current_line_blame_opts = {
         use_focus = true,
         virt_text = true,
         virt_text_pos = 'right_align',
         delay = 200,
         ignore_whitespace = false,
      },
      current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
      sign_priority = 6,
      update_debounce = 100,
      status_formatter = nil, -- Use default
      max_file_length = 40000,
      preview_config = {
         border = 'single',
         style = 'minimal',
         relative = 'cursor',
         row = 0,
         col = 1,
      },
   },
}