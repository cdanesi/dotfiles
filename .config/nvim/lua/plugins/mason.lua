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
            automatic_installation = true,
            automatic_enable = true,
            automatic_cleanup = true,
            ensure_installed = {
               -- 'ansible-lint',
               -- 'black',
               -- 'eslint_d',
               -- 'gitlint',
               -- 'htmlhint',
               -- 'isort',
               -- 'jsonlint',
               -- 'markdownlint',
               -- 'prettier',
               -- 'pylint',
               -- 'shellcheck',
               -- 'shellharden',
               -- 'stylua',
               -- 'trivy',
               -- 'yamllint',
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
            automatic_installation = true,
            automatic_enable = true,
            automatic_cleanup = true,
            ensure_installed = {
               'lua_ls',
               -- 'ansiblels',
               -- 'bashls',
               -- 'css_variables',
               -- 'cssls',
               -- 'cssmodules_ls',
               -- 'docker_compose_language_service',
               -- 'dockerls',
               -- 'emmet_ls',
               -- 'eslint',
               -- 'html',
               -- 'jsonls',
               -- 'markdown_oxide',
               -- 'marksman',
               -- 'pylsp',
               -- 'vimls',
               -- 'yamlls',
            },
         })

         --[[ mason_lspconfig.setup_handlers({
            -- default handler for installed servers
            function(server_name)
               lspconfig[server_name].setup({
                  capabilities = capabilities,
               })
            end,
            ['emmet_ls'] = function()
               -- configure emmet language server
               lspconfig['emmet_ls'].setup({
                  capabilities = capabilities,
                  filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less', 'svelte' },
               })
            end,
            ['bashls'] = function()
               lspconfig['bashls'].setup({
                  capabilities = capabilities,
                  filetypes = { 'sh', 'bash', 'zsh' },
               })
            end,
            ['lua_ls'] = function()
               -- configure lua server (with special settings)
               lspconfig['lua_ls'].setup({
                  capabilities = capabilities,
                  settings = {
                     Lua = {
                        -- make the language server recognize "vim" global
                        diagnostics = {
                           globals = { 'vim' },
                        },
                        completion = {
                           callSnippet = 'Replace',
                        },
                     },
                  },
               })
            end,
         }) ]]
      end,
   },
}