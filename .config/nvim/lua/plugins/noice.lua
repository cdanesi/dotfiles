return {
   'folke/noice.nvim',
   dependencies = {
      'MunifTanjim/nui.nvim',
      {
         'rcarriga/nvim-notify',
         opts = {
            render = 'compact',
         },
      },
      'nvim-treesitter/nvim-treesitter',
   },
   event = 'VeryLazy',
   opts = {
      lsp = {
         progress = {
            enabled = true,
            view = 'mini',
         },
         hover = {
            enabled = true,
            silent = true,
         },
         signature = {
            enabled = true,
            trigger = true,
            luasnip = true,
         },
         message = {
            enabled = true,
            view = 'notify',
         },
         documentation = {
            view = 'hover',
            opts = {
               lang = 'markdown',
            },
         },
         override = {
            ['vim.lsp.util.convert_input_to_markdown_lines'] = false,
            ['vim.lsp.util.stylize_markdown'] = false,
            ['cmp.entry.get_documentation'] = false,
         },
      },
      health = {
         checker = true,
      },
      presets = {
         bottom_search = true,
         command_palette = false,
         lsp_doc_border = true,
      },
      cmdline = {
         enabled = true,
      },
      messages = {
         enabled = true,
         view_error = 'notify',
         view_warn = 'notify',
         view_history = 'messages',
         view_search = 'virtualtext',
      },
      popupmenu = {
         enabled = true,
      },
   },
}
