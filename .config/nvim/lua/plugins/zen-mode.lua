return {
   'folke/zen-mode.nvim',
   dependencies = {
      {
         'folke/twilight.nvim',
         opts = {
            context = 10,
            treesitter = true,
            expand = {
               'function',
               'method',
               'table',
               'if_statement',
            },
            exclude = {}, -- filetypes to exclude
         },
      },
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
         wezterm = {
            enabled = true,
            font = '+4',
         },
         kitty = {
            -- INFO: not working in tmux sessions
            -- unable to get $KITTY_LISTEN_ON to update on attach
            enabled = true,
            font = '+4',
         },
      },
   },
}