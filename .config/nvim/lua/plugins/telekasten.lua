return {
   'renerocksai/telekasten.nvim',
   enabled = true,
   dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-telekasten/calendar-vim' },
   event = 'VeryLazy',
   cmd = 'Telekasten',
   opts = {
      -- default vault (notebook)
      home = os.getenv('HOME') .. '/notes',
      dailies = 'dailies/',
      weeklies = 'weeklies/',
      templates = 'templates/',

      -- default templates
      template_new_note = nil,
      template_new_daily = os.getenv('HOME') .. '/notes/templates/dailytemplate.md',
      template_new_weekly = os.getenv('HOME') .. '/notes/templates/weeklytemplate.md',

      image_subdir = '_resources',
      image_link_style = 'wiki',

      media_previewer = 'telescope-media-files',
      journal_auto_open = true, -- skips telescope prompt for goto_today and goto_thisweek
      install_syntax = true,
      tag_notation = '#tag', -- '#tag', '@tag', ':tag:', 'yaml-bare'
      subdirs_in_links = false,

      extension = '.md',
      auto_set_filetype = true,
      new_note_filename = 'uuid-title', -- possible choices 'title', 'uuid', 'uuid-title', 'title-uuid'
      uuid_type = '%Y%m%d%H%M%S',
      uuid_sep = ' ',
      filename_small_case = true,
      sort = 'modified', -- or 'filename'
      command_palette_theme = 'dropdown',
      show_tags_theme = 'get_cursor',
      rename_update_links = true,

      follow_creates_nonexisting = true,
      dailies_create_nonexisting = true,
      weeklies_create_nonexisting = true,

      -- enter any additional vaults here
      vaults = {
         blog = {
            home = os.getenv('HOME') .. '/blog/content/posts',
            dailies = nil,
            weeklies = nil,
            templates = vim.fn.expand('~/Templates/blog/'),
            template_new_note = vim.fn.expand('~/Templates/blog/blog-post.md'),
            new_note_filename = 'title',
            filename_small_case = true,
            filename_space_subst = '-',
            sort = 'filename',
            show_tags_theme = 'ivy',
            tag_notation = 'yaml-bare',
            auto_set_filetype = false,
            install_syntax = false,
         },
         testing = {
            home = os.getenv('HOME') .. '/Evernote Export.2/notes',
         },
      },

      media_extensions = {
         '.svg',
         '.png',
         '.jpg',
         '.bmp',
         '.gif',
         '.pdf',
         '.mp4',
         '.webm',
         '.webp',
      },

      plug_into_calendar = true,
      calendar_opts = {
         weeknm = 1,
         calendar_monday = 1,
         calendar_mark = 'left-fit',
      },
   },

   vim.keymap.set('n', '<leader>zP', '<cmd>Telekasten panel<cr>', { desc = 'Open Zettlekasten command palette' }),
   vim.keymap.set('n', '<leader>zV', '<cmd>Telekasten switch_vault<cr>', { desc = 'Vault picker' }),

   vim.keymap.set('n', '<leader>zf', '<cmd>Telekasten find_notes<cr>', { desc = 'Find notes by title' }),
   vim.keymap.set('n', '<leader>zD', '<cmd>Telekasten find_daily_notes<cr>', { desc = 'Find daily notes' }),
   vim.keymap.set('n', '<leader>zw', '<cmd>Telekasten find_weekly_notes<cr>', { desc = 'Find weekly notes' }),
   vim.keymap.set(
      'n',
      '<leader>zF',
      '<cmd>Telekasten find_friends<cr>',
      { desc = 'Find notes linking to note under the cursor' }
   ),
   vim.keymap.set('n', '<leader>zs', '<cmd>Telekasten search_notes<cr>', { desc = 'Search in notes' }),
   vim.keymap.set('n', '<leader>zT', '<cmd>Telekasten goto_today<cr>', { desc = "Open today's daily note" }),
   vim.keymap.set(
      'n',
      '<leader>zW',
      '<cmd>Telekasten goto_thisweek<cr>',
      { desc = 'Open weekly note for the current week' }
   ),
   vim.keymap.set('n', '<leader>zg', '<cmd>Telekasten follow_link<cr>', { desc = 'Follow the link under cursor' }),
   vim.keymap.set('n', '<leader>zy', '<cmd>Telekasten yank_notelink<cr>', { desc = 'Yank link to current note' }),
   vim.keymap.set('n', '<leader>zn', '<cmd>Telekasten new_note<cr>', { desc = 'Create a new note' }),
   vim.keymap.set(
      'n',
      '<leader>zr',
      '<cmd>Telekasten rename_note<cr>',
      { desc = 'Rename note and links pointing to it' }
   ),
   vim.keymap.set('n', '<leader>#', '<cmd>Telekasten show_tags<cr>', { desc = 'Show tag list' }),
   vim.keymap.set(
      'n',
      '<leader>zN',
      '<cmd>Telekasten new_templated_note<cr>',
      { desc = 'Create a note using a template' }
   ),
   vim.keymap.set('n', '<leader>zc', '<cmd>Telekasten show_calendar<cr>', { desc = 'Show the calendar' }),
   vim.keymap.set('n', '<leader>zC', '<cmd>CalendarT<cr>', { desc = 'Show the calendar (fill window)' }),
   vim.keymap.set('n', '<leader>zb', '<cmd>Telekasten show_backlinks<cr>', { desc = 'Show backlinks to this note' }),
   vim.keymap.set('n', '<leader>zI', '<cmd>Telekasten insert_img_link<cr>', { desc = 'Insert link to selected image' }),
   vim.keymap.set('n', '<leader>zp', '<cmd>Telekasten preview_img<cr>', { desc = 'Preview image' }),
   vim.keymap.set('n', '<leader>zm', '<cmd>Telekasten browse_media<cr>', { desc = 'Media browser' }),
   vim.keymap.set(
      'n',
      '<leader>zi',
      '<cmd>Telekasten paste_img_and_link<cr>',
      { desc = 'Paste an image from clipboard and link to it' }
   ),
   vim.keymap.set({ 'n', 'v' }, '<leader>zt', '<cmd>Telekasten toggle_todo<cr>', { desc = 'Toggle todo' }),

   -- vim.keymap.set('i', '[[', '<ESC><cmd>Telekasten insert_link<cr>', { desc = 'Link to a note' }),
}