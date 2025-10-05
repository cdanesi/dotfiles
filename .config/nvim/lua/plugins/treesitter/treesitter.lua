return {
   'nvim-treesitter/nvim-treesitter',
   branch = 'master',
   lazy = false,
   build = ':TSUpdate',

   opts = {
      sync_install = false,
      auto_install = true,
      ensure_installed = {
         -- Core / scripting
         'lua',
         'bash',
         'python',

         -- Markdown
         'markdown',
         'markdown_inline',

         -- Web / Frontend
         'html',
         'css',
         'javascript',
         'json',
         'jinja',

         -- YAML / Configs
         'yaml',
         'toml',

         -- Docker
         'dockerfile',
      },
      matchup = { enable = true },
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
