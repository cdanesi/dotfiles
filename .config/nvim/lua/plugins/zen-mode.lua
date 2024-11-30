return {
   'folke/zen-mode.nvim',
   dependencies = {
      'folke/twilight.nvim',
   },
   cmd = 'ZenMode',
   opts = {
      window = {
         width = 0.75,
         signcolumn = false,
      },
      plugins = {
         options = { enabled = true },
         twilight = { enabled = true },
         gitsigns = { enabled = true },
         tmux = { enabled = true },
         todo = { enabled = true },
         alacritty = {
            enabled = true,
            font = '16',
         },
         kitty = {
            -- INFO: not working in tmux sessions
            enabled = true,
            font = '+4',
         },
      },
   },
}
