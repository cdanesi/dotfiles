-- ~/.config/nvim/init.lua
-- Charles Danesi (https://github.com/cdanesi)

-- Settings
require("plugins-setup")
require("core.options")
require("core.keymaps")
require("core.colorscheme")

-- Plugins
require("plugins.gitsigns")
require("plugins.autopairs")
require("plugins.lualine")
require("plugins.treesitter")