vim.g.skip_ts_context_commentstring_module = true

return {
   'JoosepAlviste/nvim-ts-context-commentstring',
   dependencies = {
      'numToStr/Comment.nvim',
      'nvim-treesitter/nvim-treesitter',
   },
   event = 'VeryLazy',
   opts = {
      enable_autocmd = false,
   },
}