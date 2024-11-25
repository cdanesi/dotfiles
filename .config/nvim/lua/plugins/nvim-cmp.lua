return {
   'hrsh7th/nvim-cmp',
   event = { 'InsertEnter', 'CmdlineEnter' },
   dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lsp-document-symbol',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'saadparwaiz1/cmp_luasnip',
      'rafamadriz/friendly-snippets',
      'onsails/lspkind.nvim',
      {
         'L3MON4D3/LuaSnip',
         version = 'v2.*',
         build = 'make install_jsregexp',
      },
   },

   config = function()
      local cmp = require('cmp')
      local luasnip = require('luasnip')
      local lspkind = require('lspkind')

      require('luasnip.loaders.from_vscode').lazy_load()

      cmp.setup({
         view = {
            entries = 'custom',
            selection_order = 'near_cursor',
         },
         completion = {
            completeopt = 'menu,menuone,preview,noselect',
         },
         snippet = {
            expand = function(args)
               luasnip.lsp_expand(args.body)
            end,
         },
         mapping = cmp.mapping.preset.insert({
            ['<C-k>'] = cmp.mapping.select_prev_item(),
            ['<C-j>'] = cmp.mapping.select_next_item(),
            ['<C-b>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.abort(),
            ['<CR>'] = cmp.mapping.confirm({ select = false }),
         }),
         sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            { name = 'luasnip' },
            { name = 'buffer' },
            { name = 'path' },
         }),
         formatting = {
            format = lspkind.cmp_format({
               mode = 'symbol_text',
               maxwidth = 50,
               ellipsis_char = '...',
               show_labelDetails = true,
               menu = {
                  -- add name of source to the menu
                  nvim_lsp = '[LSP]',
                  nvim_lua = '[Lua]',
                  luasnip = '[LuaSnip]',
                  buffer = '[Buffer]',
                  path = '[Path]',
               },
            }),
         },
         -- VSCode-like, kind specific highlights
         vim.api.nvim_set_hl(0, 'CmpItemAbbrDeprecated', { bg = 'NONE', strikethrough = true, fg = '#4c566a' }),
         vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { bg = 'NONE', fg = '#81a1c1' }),
         vim.api.nvim_set_hl(0, 'CmpItemAbbrMatchFuzzy', { link = 'CmpIntemAbbrMatch' }),
         vim.api.nvim_set_hl(0, 'CmpItemKindVariable', { bg = 'NONE', fg = '#88c0d0' }),
         vim.api.nvim_set_hl(0, 'CmpItemKindInterface', { link = 'CmpItemKindVariable' }),
         vim.api.nvim_set_hl(0, 'CmpItemKindText', { link = 'CmpItemKindVariable' }),
         vim.api.nvim_set_hl(0, 'CmpItemKindFunction', { bg = 'NONE', fg = '#b48ead' }),
         vim.api.nvim_set_hl(0, 'CmpItemKindMethod', { link = 'CmpItemKindFunction' }),
         vim.api.nvim_set_hl(0, 'CmpItemKindKeyword', { bg = 'NONE', fg = '#a3be8c' }),
         vim.api.nvim_set_hl(0, 'CmpItemKindProperty', { link = 'CmpItemKindKeyword' }),
         vim.api.nvim_set_hl(0, 'CmpItemKindUnit', { link = 'CmpItemKindKeyword' }),
      })
   end,
}