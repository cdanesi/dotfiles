return {
   "akinsho/bufferline.nvim",
   dependencies = { "nvim-tree/nvim-web-devicons" },
   version = "*",
   opts = {
      options = {
         mode = "tabs",
         separator_style = "slant",
         diagnostics = "nvim_lsp",
         always_show_bufferline = false,
         show_tab_indicators = true,
         color_icons = true,
         show_buffer_icons = true,
         persist_buffer_sort = true,
         indicator = {
            style = "underline",
         },
         offsets = {
            filetype = "NvimTree",
            text = "File Explorer",
            text_align = "left",
            separator = true,
         },
      },
   },
}
