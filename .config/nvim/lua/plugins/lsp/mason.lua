return {
   'williamboman/mason.nvim',
   dependencies = {
      'WhoIsSethDaniel/mason-tool-installer.nvim',
   },
   cmd = 'Mason',
   build = ':MasonUpdate',

   config = function()
      local mason = require('mason')
      local mason_lspconfig = require('mason-lspconfig')
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

      mason_lspconfig.setup({
         ensure_installed = {
            'ansiblels',
            'bashls',
            'css_variables',
            'cssls',
            'cssmodules_ls',
            'docker_compose_language_service',
            'dockerls',
            'emmet_ls',
            'eslint',
            'html',
            'jinja_lsp',
            'jsonls',
            'lua_ls',
            'markdown_oxide',
            'marksman',
            'pylsp',
            'vimls',
            'yamlls',
         },
      })

      mason_tool_installer.setup({
         ensure_installed = {
            'ansible-lint',
            'black',
            'eslint_d',
            'gitlint',
            'htmlhint',
            'isort',
            'jinja_lsp',
            'jsonlint',
            'markdownlint',
            'prettier',
            'pylint',
            'shellcheck',
            'shellharden',
            'stylua',
            'trivy',
            'yamllint',
         },
      })
   end,
}