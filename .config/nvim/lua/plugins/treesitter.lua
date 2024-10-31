return {
   "nvim-treesitter/nvim-treesitter",
   event = { "BufReadPre", "BufNewFile" },
   build = ":TSUpdate",
   dependencies = {
      "windwp/nvim-ts-autotag",
   },
   config = function()
      local treesitter = require("nvim-treesitter.configs")

      treesitter.setup({
        highlight = {
          enable = true,
        },
        indent = { enable = true },
        autotag = { enable = true },
        ensure_installed = {
          "bash",
          "cmake",
          "cpp",
          "css",
          "diff",
          "dockerfile",
          "git_config",
          "git_rebase",
          "gitcommit",
          "gitignore",
          "graphql",
          "html",
          "javascript",
          "json",
          "lua",
          "markdown",
          "markdown_inline",
          "nginx",
          "perl",
          "php",
          "python",
          "regex",
          "sql",
          "ssh_config",
          "todotxt",
          "typescript",
          "vim",
          "xml",
          "yaml",
        },
        auto_install = true,
        incremental_selection = {
           enable = true,
           keymaps = {
              init_selection = "<C-space>",
              node_incremental = "<C-space>",
              scope_incremental = false,
              node_decremental = "<bs>",
           },
        },
     })
  end,
}
