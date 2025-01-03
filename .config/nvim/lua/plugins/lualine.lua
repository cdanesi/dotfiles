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

      local conditions = {
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
         -- │ get width of statusline
         -- │ from https://github.com/wookayin/dotfiles/blob/master/nvim/lua/config/statusline.lua
         -- └
         min_statusline_width = function(width)
            return function()
               local statusline_width
               if vim.opt.laststatus:get() == 3 then
                  -- global statusline: editor width
                  statusline_width = vim.opt.columns:get()
               else
                  -- local statusline: window width
                  statusline_width = vim.fn.winwidth(0)
               end
               return statusline_width > width
            end
         end,

         -- check if buffer is empty
         -- from https://github.com/nvim-lualine/lualine.nvim/blob/master/examples/evil_lualine.lua
         buffer_not_empty = function()
            return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
         end,
      }

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
         filetypes = { 'markdown', 'asciidoc', 'text' },
         placeholders = {
            words = nil,
            minutes = nil,
         },
      })

      lualine.setup({
         options = {
            icons_enabled = true,
            theme = 'onenord',
            component_separators = { left = '', right = '' }, -- old separators:   
            section_separators = { left = '', right = '' }, -- old separators:  
            disabled_filetypes = {
               statusline = { 'alpha', 'dashboard', 'Outline', 'NvimTree', 'undotree', 'diff' },
               winbar = { 'alpha', 'dashboard', 'Outline', 'NvimTree', 'undotree', 'diff' },
            },
            ignore_focus = {},
            always_divide_middle = true,
            always_show_tabline = true,
            globalstatus = false,
            refresh = {
               statusline = 100,
               tabline = 100,
               winbar = 100,
            },
         },
         sections = {
            lualine_a = {
               {
                  'mode',
                  -- format mode string to only display first 2 chars.
                  -- i.e., INSERT = IN, NORMAL = NO
                  -- change to res:sub(1,1) to display only the first letter
                  fmt = function(res)
                     return res:sub(1, 2)
                  end,
                  icon = ' ',
                  cond = conditions.min_statusline_width(60),
               },
            },
            lualine_b = {
               {
                  'filetype',
                  colored = true,
                  icon_only = false,
                  cond = conditions.min_statusline_width(90),
                  separator = '',
               },
               {
                  'filename',
                  file_status = true,
                  newfile_status = true,
                  path = 4,
                  symbols = {
                     modified = '[+]',
                     readonly = '[-]',
                  },
                  cond = conditions.min_statusline_width(80),
               },
            },
            lualine_c = {
               {
                  'b:gitsigns_head',
                  icon = '',
                  color = { fg = '#8fbcbb' },
                  cond = conditions.min_statusline_width(120),
               },
               {
                  'diff',
                  source = custom_components.gitsigns_diff,
                  colored = true,
                  diff_color = {
                     added = { fg = '#a3be8c' },
                     modified = { fg = '#ebcb8b' },
                     removed = { fg = '#bf616a' },
                  },
                  cond = conditions.min_statusline_width(70),
               },
            },
            lualine_x = {
               --[[ {
                  require('noice').api.status.mode.get,
                  cond = require('noice').api.status.mode.has,
                  color = { fg = '#d08770' },
               }, ]]
               {
                  -- show status when recording a macro
                  function()
                     local reg = vim.fn.reg_recording()
                     if reg == '' then return '' end
                     return '󰻃 recording @' .. reg
                  end,
                  cond = conditions.min_statusline_width(70),
                  color = { fg = '#d08770' },
               },
               -- TODO: LSP
               {
                  'diagnostics',
                  sources = { 'nvim_workspace_diagnostic' },
                  sections = { 'error', 'warn', 'info' },
                  --symbols = { error = " ", warn = " ", info = " ", hint = "󰠠 " },
                  colored = true,
                  always_visible = false,
                  cond = conditions.min_statusline_width(80),
               },
               {
                  -- display a notification if there are plugins to update
                  lazy_status.updates,
                  cond = function()
                     local window_size = conditions.min_statusline_width(120)
                     return lazy_status.has_updates() and window_size()
                  end,
                  color = { fg = '#ebcb8b' },
               },
               {
                  -- display estimated reading time
                  function()
                     return '󰁫 ' .. prose.reading_time()
                  end,
                  cond = function()
                     local window_size = conditions.min_statusline_width(100)
                     return prose.is_available() and window_size()
                  end,
                  color = { fg = '#81a1c1' },
               },
               {
                  -- display a word count for the document
                  function()
                     return '󰆙 ' .. prose.word_count()
                  end,
                  cond = function()
                     local window_size = conditions.min_statusline_width(90)
                     return prose.is_available() and window_size()
                  end,
                  color = { fg = '#a3be8c' },
               },
               {
                  -- spell status
                  function()
                     local icon = '󰓆'
                     return icon .. ' ' .. vim.fn.toupper(string.sub(vim.bo.spelllang, 1, 2))
                  end,
                  cond = function()
                     return vim.wo.spell
                  end,
                  color = { fg = '#81a1c1' },
                  -- padding = 1,
               },
               { custom_components.encoding, cond = conditions.min_statusline_width(190) },
               { custom_components.fileformat, cond = conditions.min_statusline_width(180) },
            },
            lualine_y = {
               { 'searchcount', cond = conditions.min_statusline_width(160) },
               { 'progress', cond = conditions.min_statusline_width(120) },
            },
            lualine_z = {
               { 'selectioncount', cond = conditions.min_statusline_width(160) },
               { 'location', cond = conditions.min_statusline_width(100) },
            },
         },
         inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {
               { 'filename' },
               {
                  'diff',
                  source = custom_components.gitsigns_diff,
                  cond = conditions.min_statusline_width(60),
                  colored = false,
               },
            },
            lualine_x = {
               {
                  'diagnostics',
                  sources = { 'nvim_lsp', 'nvim_workspace_diagnostic', 'nvim_diagnostic' },
                  sections = { 'error', 'warn' },
                  --symbols = { error = " ", warn = " ", info = " ", hint = "󰠠 " },
                  colored = false,
                  always_visible = false,
               },
               { 'filetype', colored = false },
            },
            lualine_y = {},
            lualine_z = {},
         },
         tabline = {},
         winbar = {
            lualine_a = {},
            lualine_b = { { 'navic', color_correction = 'nil' } },
            lualine_c = {},
            lualine_x = {},
            lualine_y = {
               {
                  'diagnostics',
                  sources = { 'nvim_lsp', 'nvim_workspace_diagnostic', 'nvim_diagnostic' },
                  sections = { 'error', 'warn', 'info' },
                  --symbols = { error = " ", warn = " ", info = " ", hint = "󰠠 " },
                  colored = true,
                  always_visible = true,
               },
            },
            lualine_z = {},
         },
         inactive_winbar = {},
         extensions = { 'nvim-tree', 'lazy', 'trouble', 'quickfix', 'fzf', 'mason', 'fugitive', 'oil' },
      })
   end,
}
