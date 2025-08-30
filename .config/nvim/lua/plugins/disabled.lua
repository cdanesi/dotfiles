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
      'mzlogin/vim-markdown-toc',
      ft = 'markdown',
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
      ft = { 'markdown', 'telekasten' },
   },
   {
      'MeanderingProgrammer/render-markdown.nvim',
      enabled = false,
      ft = { 'markdown', 'telekasten' },
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