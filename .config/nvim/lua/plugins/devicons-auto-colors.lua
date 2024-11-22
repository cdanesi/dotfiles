return {
  'rachartier/tiny-devicons-auto-colors.nvim',
  lazy = true,

  config = function()
    require('tiny-devicons-auto-colors').setup({
      cache = {
        enabled = true,
        path = vim.fn.stdpath('cache') .. '/tiny-devicons-auto-colors-cache.json',
      },
      precise_search = {
        enabled = true,
        iteration = 10,
        precision = 20,
        threshold = 23,
      },
      autoreload = true,
    })
  end,
}
