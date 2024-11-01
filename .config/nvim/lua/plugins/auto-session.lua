return {
   "rmagatti/auto-session",
   lazy = false,

   -- Configure keybinds
   keys = {
      { "<leader>wa", "<cmd>SessionToggleAutoSave<CR>", desc = "Toggle session autosave" },
      { "<leader>wD", "<cmd>Autosession delete<CR>", desc = "Delete a session" },
      { "<leader>wd", "<cmd>SessionDelete<CR>", desc = "Delete session for cwd" },
      { "<leader>wl", "<cmd>SessionSearch<CR>", desc = "Open session picker" },
      { "<leader>wr", "<cmd>SessionRestore<CR>", desc = "Restore session for cwd" },
      { "<leader>ws", "<cmd>SessionSave<CR>", desc = "Save session for cwd" },
   },

   ---@module "auto-session"
   ---@type AutoSession.Config
   opts = {
      auto_save = true,
      auto_restore = false, -- don't auto restore the last session
      session_lens = {
         load_on_setup = true,
         previewer = false,

         mappings = {
            delete_session = { "i", "<C-D>" },
            alternate_session = { "i", "<C-S>" },
            copy_session = { "i", "<C-Y>" },
         },
      },
      bypass_save_filetypes = { "alpha", "dashboard" }, -- don't save dashboard/greeter to a session
      -- Folders listed here will not have sessions created within.
      suppress_dirs = { "~/", "~/Downloads", "~/Documents", "~/Desktop", "/" },
   },
}
