return {
   "norcalli/nvim-colorizer.lua",

   config = function()
      local colorizer = require "colorizer"

      colorizer.setup {
         "css",
         "javascript",
         "python",
         "json",
         "lua",
         "toml",
         "yaml",
      }
   end,
}
