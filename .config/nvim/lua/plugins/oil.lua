return {
   'stevearc/oil.nvim',
   dependencies = { 'nvim-tree/nvim-web-devicons' },
   cmd = 'Oil',
   opts = {
      default_file_explorer = false,
      -- See :help oil-columns
      columns = {
         'icon',
      },
      buf_options = {
         buflisted = false,
         bufhidden = 'hide',
      },
      win_options = {
         wrap = false,
         signcolumn = 'yes',
         cursorcolumn = true,
         foldcolumn = '0',
         spell = false,
         list = false,
         conceallevel = 3,
         concealcursor = 'nvic',
      },
      delete_to_trash = true,
      skip_confirm_for_simple_edits = true,
      prompt_save_on_select_new_entry = true,
      cleanup_delay_ms = 2000,
      constrain_cursor = 'name',
      watch_for_changes = false,
      use_default_keymaps = true,
      view_options = {
         show_hidden = true,
         is_hidden_file = function(name, bufnr)
            local m = name:match('^%.')
            return m ~= nil
         end,
         is_always_hidden = function(name, bufnr)
            return false
         end,
         natural_order = 'fast',
         case_insensitive = false,
         sort = {
            { 'name', 'asc' },
            { 'type', 'asc' },
         },
      },
      extra_scp_args = {},
      float = {
         padding = 2,
         max_width = 100,
         max_height = 50,
         border = 'rounded',
         win_options = {
            winblend = 0,
         },
         get_win_title = nil,
         preview_split = 'right',
      },
      preview_win = {
         update_on_cursor_moved = true,
         preview_method = 'fast_scratch',
         win_options = {},
      },
      confirmation = {
         max_width = 0.7,
         min_width = { 40, 0.4 },
         max_height = 0.9,
         min_height = { 5, 0.1 },
         border = 'rounded',
         win_options = {
            winblend = 0,
         },
      },
      progress = {
         max_width = 0.6,
         min_width = { 40, 0.4 },
         max_height = { 10, 0.9 },
         min_height = { 5, 0.1 },
         border = 'rounded',
         minimized_border = 'none',
      },
      ssh = {
         border = 'rounded',
      },
      keymaps_help = {
         border = 'rounded',
      },
   },
}
