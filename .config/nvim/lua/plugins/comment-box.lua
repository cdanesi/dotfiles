return {
  'LudoPinelli/comment-box.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  keys = {
    { '<leader>Cb', '<cmd>CBllbox19<CR>', desc = 'Insert a default comment box' },
    { '<leader>Cl', '<cmd>CBccline6<CR>', desc = 'Insert a default comment line' },
  },
}
