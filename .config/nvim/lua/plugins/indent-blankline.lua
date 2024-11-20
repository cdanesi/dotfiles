return {
   "lukas-reineke/indent-blankline.nvim",
   event = { "BufReadPre", "BufNewFile" },
   main = "ibl",
   opts = {
      indent = {
         char = "┊",
         smart_indent_cap = true,
         highlight = {
            "RainbowDelimiterCyan", -- #88c0d0
            "RainbowDelimiterBlue", -- #81a1c1
            "RainbowDelimiterGreen", -- #a3be8c
            "RainbowDelimiterViolet", -- #b48ead
            "RainbowDelimiterYellow", -- #ebcb8b
            "RainbowDelimiterRed", -- #d08770
            -- "RainbowDelimiterOrange", -- #d08770
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
