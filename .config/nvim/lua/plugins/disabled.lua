return {
   {
      -- disabled while testing ccc
      'norcalli/nvim-colorizer.lua',
      enabled = false,
   },
   {
      -- replaced with telescope-symbols
      'ziontee113/icon-picker.nvim',
      enabled = false,
   },
   {
      -- TODO: configure this properly
      'ThePrimeagen/harpoon',
      enabled = false,
   },
   {
      -- TODO: decide between this, obsidian, and mkdnflow
      'renerocksai/telekasten.nvim',
      enabled = false,
   },
   {
      'epwalsh/obsidian.nvim',
      enabled = false,
   },
   {
      'jakewvincent/mkdnflow.nvim',
      enabled = false,
   },
   {
      -- I don't think I'm going to need this
      'tadmccorkle/markdown.nvim',
      enabled = false,
   },
   {
      -- torn between this and render-markdown,
      'OXY2DEV/markview.nvim',
      enabled = false,
   },
   {
      'MeanderingProgrammer/render-markdown.nvim',
      enabled = false,
   },
   {
      -- couldn't get this working..
      'JoosepAlviste/nvim-ts-context-commentstring',
      dependencies = { 'numToStr/Comment.nvim' },
      event = 'VeryLazy',
      opts = {
         enable_autocmd = false,
      },
      enabled = false,
   },
   {
      'debugloop/telescope-undo.nvim',
      enabled = false,
   },
}