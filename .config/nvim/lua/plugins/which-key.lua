return {
   'folke/which-key.nvim',
   event = 'VeryLazy',
   init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 500
   end,
   opts = {
      preset = 'modern', -- may set this back to 'classic'
      sort = { 'local', 'order', 'group', 'alphanum', 'mod' },
      notify = true,
      win = {
         title = true,
         title_pos = 'center',
         padding = { 2, 3 },
      },
      plugins = {
         marks = true,
         registers = true,
         spelling = {
            enabled = true,
            suggestions = 20,
         },
      },
   },
}
