return {
   "RRethy/vim-illuminate",
   lazy = true,
   opts = {
      providers = {
         "lsp",
         "treesitter",
         "regex",
      },
      delay = 200,
      filetypes_denylist = {
         "dashboard",
         "alpha",
         "NvimTree",
         "help",
         "markdown",
         "md",
         "dirbuf",
         "dirvish",
         "fugitive",
      },
      under_cursor = true,
      min_count_to_highlight = 1,
      case_insensitive_regex = false,
   },

   config = function(_, opts)
      require("illuminate").configure(opts)
   end,
}
