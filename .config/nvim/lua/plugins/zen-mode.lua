return {
   "folke/zen-mode.nvim",
   opts = {
      window = { signcolumn = false },
      plugins = {
         options = { enabled = true },
         twilight = { enabled = true },
         gitsigns = { enabled = true },
         tmux = { enabled = true },
         todo = { enabled = true },
         alacritty = {
            enabled = true,
            font = "16",
         },
         kitty = {
            enabled = true,
            font = "+4",
         },
      },
   },
}