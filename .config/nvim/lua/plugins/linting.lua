return {
   'mfussenegger/nvim-lint',
   event = { 'BufReadPre', 'BufNewFile' },

   config = function()
      local lint = require('lint')

      lint.linters_by_ft = {
         -- Lua
         lua = {},

         -- Shell / Bash / Zsh
         sh = { 'shellcheck' },
         bash = { 'shellcheck' },

         -- Markdown
         markdown = { 'markdownlint' },
         -- markdown_inline = { 'markdownlint' },

         -- Web / Frontend
         html = { 'htmlhint' },
         css = { 'stylelint' },
         javascript = { 'eslint_d' },
         php = { 'trivy' },

         -- YAML
         yaml = { 'yamllint' },

         -- JSON
         json = { 'jsonlint', 'jq' },

         -- Python
         python = { 'pylint' },

         -- Git commit messages
         gitcommit = { 'gitlint' },

         -- SQL
         sql = { 'sqlfluff' },

         -- Custom linters
         -- Beancount
         beancount = { 'beancount' },
      }

      lint.linters.beancount = {
         cmd = 'bean-check',
         stdin = false,
         args = { '--' },
         stream = 'stderr',
         ignore_exitcode = true,
         parser = require('lint.parser').from_errorformat('%f:%l: %m', { source = 'bean-check' }),
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
