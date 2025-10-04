--[[ vim.api.nvim_create_autocmd({ 'FocusLost', 'BufLeave' }, {
   pattern = '*',
   callback = function(args)
      local buf = args.buf or vim.api.nvim_get_current_buf()
      if vim.fn.mode() == 'n' then
         vim.defer_fn(function()
            if vim.api.nvim_buf_is_valid(buf) then require('conform').format({ bufnr = buf }) end
         end, 100)
      end
   end,
}) ]]

return {
   'stevearc/conform.nvim',
   event = { 'BufWritePre' },
   opts = {
      formatters_by_ft = {
         -- Lua
         lua = { 'lsp_format', 'stylua' },

         -- Shell / Bash / Zsh
         sh = { 'beautysh' },
         bash = { 'beautysh' },
         -- zsh = { 'beautysh' },   -- beautysh pisses me off with zsh files

         -- Markdown
         markdown = { 'prettier', 'injected' },
         -- markdown_inline = { 'prettier', 'injected' },

         -- Web / Frontend
         html = { 'prettier' },
         css = { 'prettier', 'stylelint' },
         javascript = { 'prettier', 'eslint_d' },
         php = { 'phpcbf' },

         -- YAML
         yaml = { 'prettier', 'yamlfmt' },

         -- JSON / Config
         json = { 'prettier', 'fixjson' },

         -- Python
         python = { 'black', 'isort' },

         -- SQL
         sql = { 'sqlfluff' },
      },
      format_injected = true,
      default_format_opts = {
         lsp_format = 'fallback',
      },
      format_after_save = {
         lsp_format = 'fallback',
         timeout_ms = 1000,
      },
   },

   config = function(_, opts)
      local conform = require('conform')
      conform.setup(opts)

      -- Configure injected formatter
      conform.formatters.injected = {
         options = {
            ignore_errors = false,
            lang_to_ft = {
               sh = 'sh',
               bash = 'sh',
               zsh = 'sh',
               lua = 'lua',
               javascript = 'javascript',
               json = 'json',
               yaml = 'yaml',
               markdown = 'markdown',
               python = 'python',
               html = 'html',
               css = 'css',
               toml = 'toml',
               sql = 'sql',
               php = 'php',
            },
            -- Map injected languages to the right formatter(s)
            lang_to_ext = {
               sh = 'sh',
               bash = 'sh',
               zsh = 'sh',
               javascript = 'js',
               markdown = 'md',
               json = 'json',
               yaml = 'yml',
               python = 'py',
               lua = 'lua',
               html = 'html',
               css = 'css',
               toml = 'toml',
               sql = 'sql',
               php = 'php',
            },

            --[[ lang_to_formatters = {
               sh = { 'beautysh' },
               bash = { 'beautysh'},
               javascript = {'prettier'},
               json = {'prettier'},
            }, ]]
         },
      }
   end,
}
