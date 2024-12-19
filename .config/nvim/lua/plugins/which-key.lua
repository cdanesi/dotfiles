return {
   'folke/which-key.nvim',
   dependencies = {
      'nvim-tree/nvim-web-devicons',
   },
   event = 'VeryLazy',
   init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 800
   end,
   opts = {
      preset = 'modern', -- may set this back to 'classic'
      sort = { 'local', 'order', 'group', 'case', 'alphanum', 'mod' },
      expand = 2,
      delay = 200,
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
         presets = {
            operators = true,
            motions = true,
            text_objects = true,
            windows = true,
            nav = true,
            z = true,
            g = true,
         },
      },
   },
}
