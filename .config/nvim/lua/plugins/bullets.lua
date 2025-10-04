return {
   'bullets-vim/bullets.vim',
   ft = { 'markdown', 'text', 'gitcommit' },
   config = function()
      vim.g.bullets_delete_last_bullet_if_empty = 2
   end,
}
