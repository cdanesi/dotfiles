return {
   'rmagatti/auto-session',
   -- ┌
   -- │ add nvim-tree as a dependency to stop sessions to
   -- │ reload with nvim-tree commands unavailable when saving
   -- │ with sessionopts+='globals'
   -- └
   dependencies = { 'nvim-tree/nvim-tree.lua' },
   lazy = false,

   ---@module "auto-session"
   ---@type AutoSession.Config
   opts = {
      auto_save = true,
      auto_restore = false, -- don't auto restore the last session
      auto_create = true,
      lazy_support = true,
      session_lens = {
         load_on_setup = true,
         previewer = false,
         mappings = {
            delete_session = { { 'n', 'i' }, '<C-X>' },
            alternate_session = { { 'n', 'i' }, '<C-S>' },
            copy_session = { { 'n', 'i' }, '<C-Y>' },
         },
      },
      show_auto_restore_notif = true,
      close_unsupported_windows = true,
      bypass_save_filetypes = { 'alpha', 'dashboard' }, -- don't save dashboard/greeter to a session
      -- Folders listed here will not have sessions created within.
      suppress_dirs = { '~/Downloads', '~/Desktop', '/' },
      pre_save_cmds = {},
      post_restore_cmds = {},
   },
}