return {
   'nvim-treesitter/nvim-treesitter',
   branch = 'master',
   lazy = false,
   build = ':TSUpdate',

   opts = {
      sync_install = true,
      auto_install = true,
      ensure_installed = {
         'lua',
         -- 'markdown',
         -- 'markdown_inline',
         -- 'css',
         -- 'html',
         -- 'javascript',
         -- 'json',
         -- 'xml',
         -- 'toml',
         -- 'yaml',
         -- 'python',
         -- 'bash',
         -- 'diff',
         -- 'regex',
         -- 'sql',
      },
      highlight = {
         enable = true,
         additional_vim_regex_highlighting = false,
      },
      indent = { enable = true, disable = {} },
      incremental_selection = {
         enable = true,
         keymaps = {
            init_selection = 'gnn',
            node_incremental = 'grn',
            scope_incremental = 'grc',
            node_decremental = '<bs>',
         },
      },
   },

   config = function(_, opts)
      require('nvim-treesitter.configs').setup(opts)
   end,
}