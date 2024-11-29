return {
   'LudoPinelli/comment-box.nvim',
   event = { 'BufReadPre', 'BufNewFile', 'VeryLazy' },
   opts = {
      doc_width = 80,
      box_width = 60,
      line_width = 70,
      outer_blank_lines_above = true,
      outer_blank_lines_below = true,
      inner_blank_lines = true,
   },
}
