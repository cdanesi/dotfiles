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
      enabled = false,
      dependencies = { 'nvim-telescope/telescope.nvim' },
      event = 'VeryLazy',
      opts = {
         vaults = {
            personal = {
               home = '~/vaults',
            },
            writing = {
               home = '~/notes',
            },
         },
      },

      config = function(_, opts)
         require('telekasten').setup({ opts })
      end,
      -- require('telekasten').setup({
      --    home = vim.fn.expand('~/vault'), -- Put the name of your notes directory here
      -- }),
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
      enabled = false,
      dependencies = {
         'nvim-treesitter/nvim-treesitter',
         'nvim-tree/nvim-web-devicons',
      },
      lazy = false,
      ft = 'markdown',
   },
   {
      'MeanderingProgrammer/render-markdown.nvim',
      enabled = false,
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
      enabled = false,
      cmd = { 'UndotreeToggle', 'UndotreeShow', 'UndotreeHide' },

      config = function()
         local undotree = require('undotree')

         undotree.setup()
      end,
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
