return {
   "akinsho/bufferline.nvim",
   dependencies = { "nvim-tree/nvim-web-devicons" },
   version = "*",
   opts = {
      options = {
         mode = "tabs",
         themable = true,
         separator_style = "slant",
         diagnostics = "nvim_lsp",
         -- diagnostics_indicator = function(count, level, diagnostics_dict, context)
         --    local s = " "
         --    for e, n in pairs(diagnostics_dict) do
         --       local sym = e == "error" and " " or (e == "warning" and " " or " ")
         --       s = s .. n .. sym
         --    end
         --    return s
         -- end,
         always_show_bufferline = false,
         show_tab_indicators = true,
         color_icons = true,
         show_buffer_icons = true,
         persist_buffer_sort = true,
         indicator = {
            style = "underline",
         },
         offsets = {
            {
               filetype = "NvimTree",
               text = function()
                  return vim.fn.getcwd()
               end,
               highlight = "Directory",
               separator = true,
            },
         },
      },
   },
}
