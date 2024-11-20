return {
   "hiphish/rainbow-delimiters.nvim",
   event = { "BufReadPre", "BufNewFile" },
   opts = {
      strategy = {},
      query = {},
      highlight = {
         "RainbowDelimiterCyan",
         "RainbowDelimiterBlue",
         "RainbowDelimiterGreen",
         "RainbowDelimiterViolet",
         "RainbowDelimiterYellow",
         "RainbowDelimiterRed",
         "RainbowDelimiterOrange",
      },
   },

   config = function(_, opts)
      require("rainbow-delimiters.setup").setup(opts)
   end,
}
