return {
   'nvim-lualine/lualine.nvim',
   dependencies = {
      'nvim-tree/nvim-web-devicons',
      'rmehri01/onenord.nvim',
      'skwee357/nvim-prose',
   },
   event = 'VeryLazy',
   config = function()
      local lualine = require('lualine')
      local lazy_status = require('lazy.status')
      local prose = require('nvim-prose')

      local custom_components = {
         -- ┌
         -- │ do not show encoding if UTF-8
         -- │ from https://github.com/wookayin/dotfiles/blob/master/nvim/lua/config/statusline.lua
         -- └
         encoding = function()
            local ret, _ = (vim.bo.fenc or vim.go.enc):gsub('^utf%-8$', '')
            return ret
         end,

         -- ┌
         -- │ only show non-unix file format
         -- │ from https://github.com/wookayin/dotfiles/blob/master/nvim/lua/config/statusline.lua
         -- └
         fileformat = function()
            local ret, _ = vim.bo.fileformat:gsub('^unix$', '')
            return ret
         end,

         -- ┌
         -- │ get width of current window
         -- │ from https://github.com/wookayin/dotfiles/blob/master/nvim/lua/config/statusline.lua
         -- └
         min_window_width = function(width)
            return function()
               return vim.fn.winwidth(0) > width
            end
         end,

         -- ┌
         -- │ get diff for current buffer from gitsigns
         -- │ doing this for yadm integration from gitsigns
         -- └
         gitsigns_diff = function()
            local gitsigns = vim.b.gitsigns_status_dict
            if gitsigns then
               return {
                  added = gitsigns.added,
                  modified = gitsigns.changed,
                  removed = gitsigns.removed,
               }
            end
         end,
      }

      prose.setup({
         wpm = 200.0,
         filetypes = { 'markdown', 'asciidoc' },
         placeholders = {
            words = 'words',
            minutes = 'min',
         },
      })

      lualine.setup({
         options = {
            icons_enabled = true,
            theme = 'onenord',
            component_separators = { left = '', right = '' }, -- old separators:   
            section_separators = { left = '', right = '' }, -- old separators:  
            disabled_filetypes = {
               statusline = { 'alpha', 'dashboard', 'Outline', 'NvimTree' },
               winbar = {},
            },
            ignore_focus = {},
            always_divide_middle = true,
            always_show_tabline = true,
            globalstatus = false,
            refresh = {
               statusline = 1000,
               tabline = 1000,
               winbar = 1000,
            },
         },
         sections = {
            lualine_a = { { 'mode', cond = custom_components.min_window_width(40) } },
            lualine_b = {
               {
                  'filename',
                  file_status = true,
                  newfile_status = true,
                  path = 4,
                  symbols = {
                     modified = '[+]',
                     readonly = '[-]',
                  },
                  cond = custom_components.min_window_width(100),
               },
            },
            lualine_c = {
               -- {
               --    'branch',
               --    cond = custom_components.min_window_width(180),
               -- },
               {
                  'b:gitsigns_head',
                  icon = '',
                  color = { fg = '#8fbcbb' },
                  cond = custom_components.min_window_width(180),
               },
               {
                  'diff',
                  source = custom_components.gitsigns_diff,
                  cond = custom_components.min_window_width(60),
               },
            },
            lualine_x = {
               {
                  -- show status when recording a macro
                  function()
                     local reg = vim.fn.reg_recording()
                     if reg == '' then return '' end
                     return '󰻃 recording to @' .. reg
                  end,
                  cond = custom_components.min_window_width(180),
                  color = { fg = '#d08770' },
               },
               -- TODO: LSP
               {
                  'diagnostics',
                  sources = { 'nvim_workspace_diagnostic' },
                  sections = { 'error', 'warn', 'info', 'hint' },
                  --symbols = { error = " ", warn = " ", info = " ", hint = "󰠠 " },
                  colored = true,
                  always_visible = false,
                  cond = custom_components.min_window_width(120),
               },
               {
                  lazy_status.updates,
                  cond = lazy_status.has_updates and custom_components.min_window_width(120),
                  color = { fg = '#ebcb8b' },
               },
               -- {
               --    function()
               --       return require("auto-session.lib").current_session_name(true)
               --    end,
               -- },
               {
                  function()
                     return '  ' .. prose.reading_time()
                  end,
                  cond = prose.is_available,
                  color = { fg = '#81a1c1' },
               },
               {
                  function()
                     return '  ' .. prose.word_count()
                  end,
                  cond = prose.is_available,
                  color = { fg = '#a3be8c' },
               },
               {
                  -- spell status
                  function()
                     local icon = '󰓆'
                     return icon .. ' ' .. vim.fn.toupper(string.sub(vim.bo.spelllang, 1, 2))
                  end,
                  cond = custom_components.min_window_width(120) and function()
                     return vim.wo.spell
                  end,
                  color = { fg = '#81a1c1' },
                  padding = 1,
               },
               { custom_components.encoding, cond = custom_components.min_window_width(190) },
               { custom_components.fileformat, cond = custom_components.min_window_width(180) },
               { 'filetype', cond = custom_components.min_window_width(120) },
            },
            lualine_y = {
               { 'searchcount', cond = custom_components.min_window_width(180) },
               { 'progress', cond = custom_components.min_window_width(180) },
            },
            lualine_z = {
               { 'selectioncount', cond = custom_components.min_window_width(180) },
               { 'location', cond = custom_components.min_window_width(190) },
            },
         },
         inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = { 'filename' },
            lualine_x = {
               {
                  'diagnostics',
                  sources = { 'nvim_lsp', 'nvim_workspace_diagnostic', 'nvim_diagnostic' },
                  sections = { 'error', 'warn', 'info', 'hint' },
                  --symbols = { error = " ", warn = " ", info = " ", hint = "󰠠 " },
                  colored = false,
                  always_visible = false,
               },
            },
            lualine_y = {},
            lualine_z = { 'location' },
         },
         tabline = {},
         winbar = {},
         inactive_winbar = {},
         extensions = { 'nvim-tree', 'lazy', 'trouble', 'quickfix', 'fzf', 'mason' },
      })
   end,
}
