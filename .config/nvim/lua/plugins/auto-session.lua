return {
   'rmagatti/auto-session',
   lazy = false,

   ---@module "auto-session"
   ---@type AutoSession.Config
   opts = {
      auto_save = true,
      auto_restore = false, -- don't auto restore the last session
      lazy_support = true,
      session_lens = {
         load_on_setup = true,
         previewer = false,

         mappings = {
            delete_session = { 'i', '<C-D>' },
            alternate_session = { 'i', '<C-S>' },
            copy_session = { 'i', '<C-Y>' },
         },
      },
      bypass_save_filetypes = { 'alpha', 'dashboard' }, -- don't save dashboard/greeter to a session
      -- Folders listed here will not have sessions created within.
      suppress_dirs = { '~/', '~/Downloads', '~/Desktop', '/' },
   },
}
