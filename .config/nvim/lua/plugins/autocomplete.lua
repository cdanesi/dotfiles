return {
   'hrsh7th/nvim-cmp',
   event = { 'InsertEnter', 'CmdlineEnter' },
   dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-calc',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lsp-document-symbol',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'chrisgrieser/cmp-nerdfont', -- triggered by ':' (insert mode)
      'onsails/lspkind.nvim',
      {
         'L3MON4D3/LuaSnip',
         version = 'v2.*',
         build = 'make install_jsregexp',
         opts = {
            history = true,
            updateevents = 'TextChanged,TextChangedI',
         },
      },
      'saadparwaiz1/cmp_luasnip',
      'rafamadriz/friendly-snippets',
   },

   config = function()
      local cmp = require('cmp')
      local snippet = require('luasnip')
      local lspkind = require('lspkind')
      local select_opts = { behavior = cmp.SelectBehavior.Select }

      require('luasnip.loaders.from_vscode').lazy_load() -- friendly-snippets
      require('luasnip.loaders.from_lua').load({ paths = { vim.fn.stdpath('config') .. '/snippets' } }) -- my custom snippets

      cmp.setup({
         enabled = function()
            -- disable completion in comments
            local context = require('cmp.config.context')

            if vim.api.nvim_get_mode().mode == 'c' then
               return true
            else
               return not context.in_treesitter_capture('comment') and not context.in_syntax_group('Comment')
            end
         end,
         view = {
            entries = 'custom',
            selection_order = 'near_cursor',
         },
         window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
         },
         completion = {
            completeopt = 'menu,preview,noselect',
         },
         snippet = {
            expand = function(args)
               snippet.lsp_expand(args.body)
            end,
         },
         mapping = cmp.mapping.preset.insert({
            ['<C-k>'] = cmp.mapping.select_prev_item(),
            ['<C-j>'] = cmp.mapping.select_next_item(),
            ['<C-u>'] = cmp.mapping.scroll_docs(-4),
            ['<C-d>'] = cmp.mapping.scroll_docs(4),
            -- ['<C-Space>'] = cmp.mapping.complete(),

            -- ┌
            -- │ if completion menu is visible, move prev/next with
            -- │ tab/s-tab
            -- │ if not attached to anything, then insert a tab
            -- │ if inside a word, trigger the completion menu
            -- └
            ['<Tab>'] = cmp.mapping(function(fallback)
               local col = vim.fn.col('.') - 1

               if cmp.visible() then
                  cmp.select_next_item(select_opts)
               elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
                  fallback()
               else
                  cmp.complete()
               end
            end, { 'i', 's' }),
            ['<S-Tab>'] = cmp.mapping(function(fallback)
               if cmp.visible() then
                  cmp.select_prev_item(select_opts)
               else
                  fallback()
               end
            end, { 'i', 's' }),
            ['<C-e>'] = cmp.mapping.abort(),
            ['<CR>'] = cmp.mapping.confirm({ select = false }),
            ['<C-f>'] = cmp.mapping(function(fallback)
               if snippet.jumpable(1) then
                  snippet.jump(1)
               else
                  fallback()
               end
            end, { 'i', 's' }),
            ['<C-b>'] = cmp.mapping(function(fallback)
               if snippet.jumpable(-1) then
                  snippet.jump(-1)
               else
                  fallback()
               end
            end, { 'i', 's' }),
         }),
         sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            { name = 'luasnip' },
            { name = 'path' },
            { name = 'nvim_lsp_signature_help' },
            { name = 'nvim_lua' },
            { name = 'nerdfont' },
            { name = 'calc' },
            { name = 'buffer', keyword_length = 5 },
         }),
         ---@diagnostic disable-next-line: missing-fields
         formatting = {
            -- fields = { 'abbr', 'kind', 'menu' },
            expandable_indicator = true,
            format = function(entry, vim_item)
               if vim.tbl_contains({ 'path' }, entry.source.name) then
                  local icon, hl_group = require('nvim-web-devicons').get_icon(entry:get_completion_item().label)
                  if icon then
                     vim_item.kind = icon
                     vim_item.kind_hl_group = hl_group
                     return vim_item
                  end
               end
               return lspkind.cmp_format({
                  with_text = false,
                  mode = 'symbol_text',
                  maxwidth = 50,
                  ellipsis_char = '...',
                  show_labelDetails = true,
                  menu = {
                     -- add name of source to the menu
                     nvim_lsp = '[LSP]',
                     nvim_lua = '[Lua]',
                     luasnip = '[Snip]',
                     buffer = '[Buf]',
                     path = '[Path]',
                     latex_symbols = '[Latex]',
                     spell = '[Spell]',
                     nerdfont = '[NF]',
                     calc = '[Calc]',
                  },
               })(entry, vim_item)
            end,
         },

         --  ───────────────[ VSCode-like, kind specific highlights ]───────────────
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

      cmp.setup.cmdline({ '/', '?' }, {
         mapping = cmp.mapping.preset.cmdline(),
         view = {
            entries = {
               name = 'wildmenu',
               separator = '',
            },
         },
         sources = {
            { name = 'nvim_lsp_document_symbol' },
            { name = 'buffer' },
         },
      })

      -- FIX: on my Arch laptop, 't' as first character on cmdline escapes
      -- the cmdline and destructively prints xx:xx to the document
      cmp.setup.cmdline(':', {
         enabled = function()
            local disabled = {
               -- list of commands to disable completions
               wq = true,
               wqa = true,
            }
            local cmd = vim.fn.getcmdline():match('%S+')
            return not disabled[cmd] or cmp.close()
         end,
         mapping = cmp.mapping.preset.cmdline(),
         sources = {
            { name = 'cmdline' },
            { name = 'path' },
         },
         ---@diagnostic disable-next-line: missing-fields
         matching = {
            disallow_fullfuzzy_matching = false,
            disallow_fuzzy_matching = false,
            disallow_partial_fuzzy_matching = false,
            disallow_partial_matching = false,
            disallow_prefix_unmatching = false,
            disallow_symbol_nonprefix_matching = false,
         },
      })
   end,
}
