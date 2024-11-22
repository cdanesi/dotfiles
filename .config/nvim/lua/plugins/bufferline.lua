return {
  'akinsho/bufferline.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  version = '*',
  event = 'VeryLazy',
  opts = {
    options = {
      mode = 'buffer',
      separator_style = 'slant',
      diagnostics = 'nvim_lsp',
      -- diagnostics_indicator = function(count, level, diagnostics_dict, context)
      --    local s = " "
      --    for e, n in pairs(diagnostics_dict) do
      --       local sym = e == "error" and " " or (e == "warning" and " " or " ")
      --       s = s .. n .. sym
      --    end
      --    return s
      -- end,
      always_show_bufferline = false,
      show_tab_indicators = false,
      color_icons = true,
      show_buffer_icons = true,
      persist_buffer_sort = true,
      indicator = {
        style = 'underline',
      },
      offsets = {
        {
          filetype = 'NvimTree',
          text = function()
            return vim.fn.getcwd()
          end,
          highlight = 'Directory',
          separator = true,
        },
      },
      custom_areas = {
        right = function()
          local result = {}
          local seve = vim.diagnostic.severity
          local error = #vim.diagnostic.get(0, { severity = seve.ERROR })
          local warning = #vim.diagnostic.get(0, { severity = seve.WARN })
          local info = #vim.diagnostic.get(0, { severity = seve.INFO })
          local hint = #vim.diagnostic.get(0, { severity = seve.HINT })

          if error ~= 0 then table.insert(result, { text = '  ' .. error, link = 'DiagnosticError' }) end

          if warning ~= 0 then table.insert(result, { text = '  ' .. warning, link = 'DiagnosticWarn' }) end

          if hint ~= 0 then table.insert(result, { text = '  ' .. hint, link = 'DiagnosticHint' }) end

          if info ~= 0 then table.insert(result, { text = '  ' .. info, link = 'DiagnosticInfo' }) end
          return result
        end,
      },
    },
  },
}
