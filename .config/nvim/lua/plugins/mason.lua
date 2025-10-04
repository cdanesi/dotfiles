return {
   {
      'mason-org/mason.nvim',
      -- 'williamboman/mason.nvim',
      dependencies = {
         'neovim/nvim-lspconfig',
         'hrsh7th/cmp-nvim-lsp',
         'WhoIsSethDaniel/mason-tool-installer.nvim',
      },
      cmd = 'Mason',
      event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
      build = ':MasonUpdate',

      config = function()
         local mason = require('mason')
         local mason_tool_installer = require('mason-tool-installer')

         mason.setup({
            ui = {
               -- style = 'minimal',
               border = 'rounded',
               width = 0.7,
               height = 0.8,
               icons = {
                  package_installed = '✓',
                  package_pending = '➜',
                  package_uninstalled = '✗',
               },
            },
         })

         mason_tool_installer.setup({
            auto_update = true,
            run_on_start = true,
            start_delay = 5000,
            -- debounce_hours = 2,
            ensure_installed = {
               -- Shell / Bash / Zsh
               'shellcheck',
               'beautysh',

               -- Markdown
               'markdownlint',

               -- Web / Frontend
               'eslint_d',
               'stylelint',
               'htmlhint',
               'prettier',
               'trivy', -- PHP
               'phpcbf', -- PHP

               -- YAML / Ansible
               'yamllint',
               'ansible-lint',

               -- JSON / Config
               'jsonlint',
               'jq',

               -- Python
               'black',
               'isort',
               'pylint',

               -- Lua
               'stylua',

               -- Git commit messages
               'gitlint',

               -- SQL
               'sqlfluff',
            },
         })
      end,
   },
   {
      'mason-org/mason-lspconfig.nvim',
      dependencies = {
         { 'mason-org/mason.nvim', opts = {} },
         'neovim/nvim-lspconfig',
      },
      lazy = true,
      opts = {},

      config = function()
         local mason_lspconfig = require('mason-lspconfig')
         local lspconfig = require('lspconfig')
         local capabilities = require('cmp_nvim_lsp').default_capabilities()

         mason_lspconfig.setup({
            ensure_installed = {
               -- Core
               'lua_ls',
               'marksman',
               'bashls',

               -- Infra / configs
               'ansiblels',
               'dockerls',
               'yamlls',
               'jsonls',
               'taplo',
               'systemd_ls',

               -- Web / frontend
               'html',
               'cssls',
               'eslint',
               'emmet_ls',
               'stylelint_lsp',

               -- Python
               'pyright',
            },
            handlers = {
               -- default handler
               function(server_name)
                  lspconfig[server_name].setup({
                     capabilities = capabilities,
                  })
               end,
               -- overrides
               bashls = function()
                  lspconfig.bashls.setup({
                     capabilities = capabilities,
                     filetypes = { 'sh', 'bash', 'zsh' },
                  })
               end,
               lua_ls = function()
                  lspconfig.lua_ls.setup({
                     capabilities = capabilities,
                     settings = {
                        Lua = {
                           diagnostics = { globals = { 'vim' } },
                           completion = { callSnippet = 'Replace' },
                        },
                     },
                  })
               end,
            },
         })
      end,
   },
}
