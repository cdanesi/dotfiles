return {
   'windwp/nvim-autopairs',
   event = { 'InsertEnter' },
   dependencies = {
      'hrsh7th/nvim-cmp',
   },
   opts = {
      check_ts = true,
      map_cr = false,
      map_bs = true,
      map_c_h = true, -- <C-h> deletes a pair
      map_c_w = true, -- <C-w> delete pair if possible
   },
}
