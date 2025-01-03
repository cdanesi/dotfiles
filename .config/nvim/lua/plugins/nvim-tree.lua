return {
   'nvim-tree/nvim-tree.lua',
   dependencies = 'nvim-tree/nvim-web-devicons',
   cmd = {
      'NvimTreeToggle',
      'NvimTreeFindFileToggle',
      'NvimTreeCollapse',
      'NvimTreeRefresh',
   },
   init = function()
      vim.g.disable_netrw = false
      vim.g.loaded_netrwPlugin = true
   end,
   opts = {
      respect_buf_cwd = false,
      view = {
         width = {
            min = 25,
            max = 45,
         },
         relativenumber = true,
         signcolumn = 'yes',
      },
      renderer = {
         indent_markers = {
            enable = true,
         },
         icons = {
            web_devicons = {
               file = {
                  enable = true,
                  color = true,
               },
               folder = {
                  enable = true,
                  color = true,
               },
            },
            git_placement = 'signcolumn',
            modified_placement = 'after',
            diagnostics_placement = 'signcolumn',
            padding = ' ',
            show = {
               file = true,
               folder = true,
               folder_arrow = true,
               git = true,
               modified = true,
               hidden = false,
               diagnostics = true,
               bookmarks = true,
            },
            glyphs = {
               default = '',
               modified = '●',
               folder = {
                  default = '',
                  open = '',
                  empty = '',
                  empty_open = '',
                  arrow_closed = '',
                  arrow_open = '',
               },
               git = {
                  unstaged = '✗',
                  staged = '✓',
                  unmerged = '',
                  renamed = '➜',
                  untracked = '★',
                  deleted = '',
                  ignored = '◌',
               },
            },
         },
      },
      actions = {
         open_file = {
            window_picker = {
               enable = false,
            },
         },
      },
      filters = {
         enable = true,
         git_ignored = true,
         dotfiles = false,
         -- custom = { '.DS_Store' },
      },
      git = {
         enable = true,
         show_on_dirs = true,
         ignore = false,
      },
      diagnostics = {
         enable = true,
         show_on_open_dirs = true,
      },
      modified = {
         enable = true,
         show_on_dirs = true,
         show_on_open_dirs = true,
      },
   },
}