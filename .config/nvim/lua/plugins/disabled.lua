return {
   {
      -- disabled while testing ccc
      'norcalli/nvim-colorizer.lua',
      enabled = false,
      ft = {
         'markdown',
         'javascript',
         'html',
         'css',
         'python',
         'json',
         'lua',
         'toml',
         'yaml',
      },
      opts = {
         'css',
         'javascript',
         'html',
         'markdown',
         'python',
         'json',
         'lua',
         'toml',
         'yaml',
      },
   },
   {
      -- replaced with telescope-symbols
      'ziontee113/icon-picker.nvim',
      enabled = false,
      dependencies = {
         'stevearc/dressing.nvim',
      },
      cmd = { 'IconPickerNormal', 'IconPickerYank', 'IconPickerInsert' },
      opts = {
         disable_legacy_commands = true,
      },
   },
   {
      -- TODO: decide between this, obsidian, and mkdnflow
      'renerocksai/telekasten.nvim',
      enabled = true,
      dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-telekasten/calendar-vim' },
      event = 'VeryLazy',
      cmd = 'Telekasten',
      opts = {
         -- main notes locations
         home = os.getenv('HOME') .. '/notes',
         dailies = 'dailies/',
         weeklies = 'weeklies/',
         templates = 'templates/',

         -- specific note templates
         template_new_note = nil,
         template_new_daily = os.getenv('HOME') .. '/notes/templates/dailytemplate.md',
         template_new_weekly = os.getenv('HOME') .. '/notes/templates/weeklytemplate.md',

         -- enter any additional vaults here
         --[[ vaults = {
            personal = {
               home = '~/notes/personal/',
            },
            writing = {
               home = 'writing/',
            },
         }, ]]

         image_subdir = 'img',
         extension = '.md',
         new_note_filename = 'uuid-title',
         uuid_type = '%Y%m%d%H%M',
         uuid_sep = '-',

         follow_creates_nonexisting = true,
         dailies_create_nonexisting = true,
         weeklies_create_nonexisting = true,

         sort = 'modified',

         command_palette_theme = 'dropdown',
         show_tags_theme = 'get_cursor',

         media_previewer = 'telescope-media-files',

         plug_into_calendar = true,
         calendar_opts = {
            weeknm = 5,
            calendar_monday = 1,
         },
      },
      vim.keymap.set('n', '<leader>z', '<cmd>Telekasten panel<cr>', { desc = 'Open Zettlekasten command palette' }),
      vim.keymap.set('n', '<leader>zf', '<cmd>Telekasten find_notes<cr>', { desc = 'Find notes' }),
      vim.keymap.set('n', '<leader>zs', '<cmd>Telekasten search_notes<cr>', { desc = 'Search in notes' }),
      vim.keymap.set('n', '<leader>zd', '<cmd>Telekasten goto_today<cr>', { desc = "Open today's daily note" }),
      vim.keymap.set('n', '<leader>zz', '<cmd>Telekasten follow_link<cr>', { desc = 'Follow this link' }),
      vim.keymap.set('n', '<leader>zn', '<cmd>Telekasten new_note<cr>', { desc = 'Create a note in selected vault' }),
      vim.keymap.set('n', '<leader>zc', '<cmd>Telekasten show_calendar<cr>', { desc = 'Show the calendar' }),
      vim.keymap.set('n', '<leader>zb', '<cmd>Telekasten show_backlinks<cr>', { desc = 'Show backlinks to this note' }),
      vim.keymap.set('n', '<leader>zI', '<cmd>Telekasten insert_img_link<cr>', { desc = 'Insert an image link' }),
      -- vim.keymap.set('i', '[[', '<cmd>Telekasten insert_link<cr>', { desc = 'Insert a link' }),
   },
   {
      'epwalsh/obsidian.nvim',
      enabled = false,
   },
   {
      'jakewvincent/mkdnflow.nvim',
      enabled = false,
   },
   {
      -- I don't think I'm going to need this
      'tadmccorkle/markdown.nvim',
      enabled = false,
   },
   {
      -- torn between this and render-markdown,
      'OXY2DEV/markview.nvim',
      enabled = true,
      dependencies = {
         'nvim-treesitter/nvim-treesitter',
         'nvim-tree/nvim-web-devicons',
      },
      ft = 'markdown',
   },
   {
      'MeanderingProgrammer/render-markdown.nvim',
      enabled = false,
      ft = 'markdown',
   },
   {
      'nvim-telescope/telescope-frecency.nvim',
      enabled = false,
      dependencies = {
         'nvim-telescope/telescope.nvim',
      },
      config = function()
         require('telescope').setup({
            extensions = {
               frecency = {
                  show_scores = true,
                  -- matcher = "fuzzy",
                  db_safe_mode = false,
                  auto_validate = true,
                  db_validate_threshold = 10,
                  show_filter_column = false,
                  ignore_patterns = { '*/.git', '*/.git/*', '*/.DS_Store' },
                  workspaces = {
                     ['dots'] = '$HOME/.config',
                     ['proj'] = '$HOME/projects',
                     ['ansible'] = '$HOME/projects/ansible',
                     ['docker'] = '$HOME/projects/docker',
                     ['code'] = '$HOME/projects/code',
                  },
               },
            },
         })
         require('telescope').load_extension('frecency')
      end,
   },
   {
      -- couldn't get this working..
      'JoosepAlviste/nvim-ts-context-commentstring',
      enabled = false,
      dependencies = { 'numToStr/Comment.nvim' },
      event = 'VeryLazy',
      opts = {
         enable_autocmd = false,
      },
   },
   {
      'mbbill/undotree',
      enabled = true,
      cmd = { 'UndotreeToggle', 'UndotreeShow', 'UndotreeHide' },
   },
   {
      'debugloop/telescope-undo.nvim',
      enabled = false,
      dependencies = {
         {
            'nvim-telescope/telescope.nvim',
            dependencies = { 'nvim-lua/plenary.nvim' },
         },
      },
      keys = {
         {
            '<leader>u',
            '<cmd>Telescope undo<cr>',
            desc = 'Undo history',
         },
      },
      opts = {
         extensions = {
            undo = {
               use_delta = true,
               side_by_side = true,
               saved_only = false,
               layout_strategy = 'vertical',
               layout_config = {
                  preview_height = 0.8,
               },
               mappings = {
                  i = {
                     ['<C-y>'] = function(bufnr)
                        return require('telescope-undo.actions').yank_additions(bufnr)
                     end,
                     ['<C-Y>'] = function(bufnr)
                        return require('telescope-undo.actions').yank_deletions(bufnr)
                     end,
                     ['<C-cr>'] = function(bufnr)
                        return require('telescope-undo.actions').restore(bufnr)
                     end,
                  },
                  n = {
                     ['y'] = function(bufnr)
                        return require('telescope-undo.actions').yank_additions(bufnr)
                     end,
                     ['Y'] = function(bufnr)
                        return require('telescope-undo.actions').yank_deletions(bufnr)
                     end,
                     ['u'] = function(bufnr)
                        return require('telescope-undo.actions').restore(bufnr)
                     end,
                  },
               },
            },
         },
      },
      config = function(_, opts)
         require('telescope').setup(opts)
         require('telescope').load_extension('undo')
      end,
   },
}