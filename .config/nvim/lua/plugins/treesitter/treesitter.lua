return {
   'nvim-treesitter/nvim-treesitter',
   -- event = { "BufReadPre", "BufNewFile" },
   lazy = true,
   cmd = { 'TSUpdateSync', 'TSUpdate', 'TSInstall' },
   build = ':TSUpdate',
   opts = {
      highlight = {
         enable = true,
         additional_vim_regex_highlighting = false,
      },
      indent = { enable = true, disable = {} },
      ensure_installed = {
         'bash',
         'css',
         'diff',
         'dockerfile',
         'git_config',
         'git_rebase',
         'gitcommit',
         'gitignore',
         'graphql',
         'html',
         'javascript',
         'json',
         'lua',
         'markdown',
         'markdown_inline',
         'python',
         'regex',
         'sql',
         'todotxt',
         'vim',
         'vimdoc',
         'xml',
         'tmux',
         'toml',
         'yaml',
      },
      ignore_install = {},
      sync_install = true,
      auto_install = true,
      incremental_selection = {
         enable = true,
         keymaps = {
            init_selection = '<C-space>',
            node_incremental = '<C-space>',
            scope_incremental = false,
            node_decremental = '<bs>',
         },
      },
   },
}