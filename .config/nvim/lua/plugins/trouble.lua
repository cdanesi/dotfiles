return {
   'folke/trouble.nvim',
   dependencies = {
      'nvim-tree/nvim-web-devicons',
   },
   cmd = 'Trouble',
   opts = {
      focus = false,
      warn_no_results = false,
      open_no_results = true,
      auto_close = false,
      auto_open = false,
      auto_preview = true,
      auto_refresh = true,
      auto_jump = false,
      restore = true,
      follow = true,
      indent_guides = true,
      max_items = 200,
      multiline = true,
      pinned = false,
   },
}