return {
   'neovim/nvim-lspconfig',
   lazy = false,
   dependencies = {
      { 'antosha417/nvim-lsp-file-operations', config = true },
      { 'folke/lazydev.nvim',                  config = true },
   },

   config = function()
      local keymap = vim.keymap

      vim.api.nvim_create_autocmd('LspAttach', {
         group = vim.api.nvim_create_augroup('UserLspConfig', {}),
         callback = function(args)
            local opts = { buffer = args.buf, silent = true }

            opts.desc = 'Show LSP references'
            keymap.set('n', 'gR', '<cmd>Telescope lsp_references<CR>', opts)

            opts.desc = 'Go to declaration'
            keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)

            opts.desc = 'Show LSP definitions'
            keymap.set('n', 'gd', '<cmd>Telescope lsp_definitions<CR>', opts)

            opts.desc = 'Show LSP implementations'
            keymap.set('n', 'gi', '<cmd>Telescope lsp_implementations<CR>', opts)

            opts.desc = 'Show LSP type definitions'
            keymap.set('n', 'gt', '<cmd>Telescope lsp_type_definitions<CR>', opts)

            opts.desc = 'See available code actions'
            keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)

            opts.desc = 'Smart rename'
            keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)

            opts.desc = 'Show buffer diagnostics'
            keymap.set('n', '<leader>D', '<cmd>Telescope diagnostics bufnf=0<CR>', opts)

            opts.desc = 'Show line diagnostics'
            keymap.set('n', '<leader>d', vim.diagnostic.open_float, opts)

            opts.desc = 'Show documentation for what is under cursor'
            keymap.set('n', 'K', vim.lsp.buf.hover, opts)

            opts.desc = 'Restart LSP'
            keymap.set('n', '<leader>rs', ':LspRestart<CR>', opts)
         end,
      })

      vim.diagnostic.config({
         virtual_text = {
            prefix = '●',
         },
         update_in_insert = true,
         underline = true,
         severity_sort = true,
         float = {
            focusable = false,
            style = 'minimal',
            border = 'rounded',
            source = true,
            show_header = true,
            prefix = '',
         },
         signs = {
            text = {
               [vim.diagnostic.severity.ERROR] = ' ',
               [vim.diagnostic.severity.WARN] = ' ',
               [vim.diagnostic.severity.HINT] = '󰠠 ',
               [vim.diagnostic.severity.INFO] = ' ',
            },
            texthl = {
               [vim.diagnostic.severity.ERROR] = 'Error',
               [vim.diagnostic.severity.WARN] = 'Error',
               [vim.diagnostic.severity.HINT] = 'Hint',
               [vim.diagnostic.severity.INFO] = 'Info',
            },
            numhl = {
               [vim.diagnostic.severity.ERROR] = '',
               [vim.diagnostic.severity.WARN] = '',
               [vim.diagnostic.severity.HINT] = '',
               [vim.diagnostic.severity.INFO] = '',
            },
         },
      })
   end,
}