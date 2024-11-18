return {
   "lukas-reineke/indent-blankline.nvim",
   event = { "BufReadPre", "BufNewFile" },
   main = "ibl",
   opts = {
      indent = {
         char = "┊",
         smart_indent_cap = true,
         highlight = {
            -- indent coloring for nord theme
            -- FIX: set these up manually?
            "Headline6",
            "Headline5",
            "Headline4",
            "Headline3",
            "Headline2",
            "Headline1",
         },
      },
      scope = {
         enabled = true,
         show_start = true,
         show_end = true,
         -- highlight = { "Function", "Label" },
         char = "▎",
      },
      exclude = {
         filetypes = {
            "lspinfo",
            "checkhealth",
            "help",
            "man",
            "gitcommit",
            "TelescopePrompt",
            "TelescopeResults",
            "",
            "dashboard",
            "alpha",
            "NvimTree",
         },
      },
   },
}
