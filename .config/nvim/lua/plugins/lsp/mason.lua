return {
  'williamboman/mason.nvim',
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
  },
  event = 'VeryLazy',
  build = ':MasonUpdate',

  config = function()
    local mason = require('mason')
    local mason_lspconfig = require('mason-lspconfig')
    local mason_tool_installer = require('mason-tool-installer')

    mason.setup({
      ui = {
        -- style = 'minimal',
        border = 'rounded',
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
        'beautysh',
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
