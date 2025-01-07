return {
   'mfussenegger/nvim-lint',
   event = { 'BufReadPre', 'BufNewFile' },

   config = function()
      local lint = require('lint')

      lint.linters_by_ft = {
         markdown = { 'markdownlint' },
         html = { 'htmlhint' },
         json = { 'jsonlint' },
         sh = { 'shellcheck' },
         bash = { 'shellcheck' },
         javascript = { 'eslint_d', 'trivy' },
         typescript = { 'eslint_d' },
         python = { 'pylint', 'trivy' },
         ansible = { 'ansiblelint' },
         gitcommit = { 'gitlint' },
         docker = { 'trivy' },
         yaml = { 'yamllint' },
         editorconfig = { 'editorconfig-checker' },
         systemd = { 'systemdlint' },
      }

      local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })

      vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
         group = lint_augroup,
         callback = function()
            lint.try_lint()
         end,
      })
   end,
}