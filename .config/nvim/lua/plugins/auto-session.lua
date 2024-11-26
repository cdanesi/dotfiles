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
            delete_session = { { 'n', 'i' }, '<C-D>' },
            alternate_session = { { 'n', 'i' }, '<C-S>' },
            copy_session = { { 'n', 'i' }, '<C-Y>' },
         },
      },
      show_auto_restore_notif = true,
      bypass_save_filetypes = { 'alpha', 'dashboard' }, -- don't save dashboard/greeter to a session
      -- Folders listed here will not have sessions created within.
      suppress_dirs = { '~/', '~/Downloads', '~/Desktop', '/' },
   },
}