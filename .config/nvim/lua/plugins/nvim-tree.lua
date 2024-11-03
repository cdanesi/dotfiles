return {
   "nvim-tree/nvim-tree.lua",
   dependencies = "nvim-tree/nvim-web-devicons",
   opts = {
      view = {
         width = 35,
         relativenumber = true,
      },
      renderer = {
         indent_markers = {
            enable = true,
         },
         icons = {
            glyphs = {
               default = "",
               folder = {
                  default = "",
                  open = "",
                  empty = "",
                  empty_open = "",
                  arrow_closed = "", -- arrow when folder is closed
                  arrow_open = "", -- arrow when folder is open
               },
            },
         },
      },
      actions = {
         open_file = {
            window_picker = {
               enable = false,
            },
         },
      },
      filters = {
         custom = { ".DS_Store" },
      },
      git = {
         ignore = false,
      },
   },

   config = function(_, opts)
      vim.g.loaded_netrwPlugin = 1

      require("nvim-tree").setup(opts)
   end,
}
