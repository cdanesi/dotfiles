return {
   'stevearc/conform.nvim',
   event = { 'BufReadPre', 'BufNewFile' },
   opts = {
      formatters_by_ft = {
         sh = { 'beautysh', 'shellharden' },
         bash = { 'beautysh', 'shellharden' },
         zsh = { 'beautysh' },
         javascript = { 'prettier' },
         typescript = { 'prettier' },
         css = { 'prettier' },
         html = { 'prettier' },
         json = { 'prettier' },
         yaml = { 'prettier' },
         markdown = { 'markdownlint', 'prettier' },
         graphql = { 'prettier' },
         liquid = { 'prettier' },
         lua = { 'stylua' },
         python = { 'black', 'sort' },
      },
      formatters = {
         --[[ shfmt = {
            prepend_args = { '-i', '6' },
         }, ]]
      },
      default_format_opts = {
         lsp_format = 'fallback',
      },
      format_on_save = {
         lsp_format = 'fallback',
         async = false,
         timeout_ms = 1000,
      },
   },
}
