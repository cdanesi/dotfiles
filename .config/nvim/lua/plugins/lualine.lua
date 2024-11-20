return {
   "nvim-lualine/lualine.nvim",
   dependencies = {
      "nvim-tree/nvim-web-devicons",
      "rmehri01/onenord.nvim",
   },
   config = function()
      local lualine = require "lualine"
      local lazy_status = require "lazy.status"

      lualine.setup {
         options = {
            icons_enabled = true,
            theme = "onenord",
            component_separators = { left = "", right = "" },
            section_separators = { left = "", right = "" },
            disabled_filetypes = {
               statusline = { "alpha", "dashboard", "Outline" },
               winbar = {},
            },
            ignore_focus = { "NvimTree" },
            always_divide_middle = true,
            always_show_tabline = true,
            globalstatus = false,
            refresh = {
               statusline = 1000,
               tabline = 1000,
               winbar = 1000,
            },
         },
         sections = {
            lualine_a = { "mode" },
            lualine_b = {
               {
                  "filename",
                  file_status = true,
                  newfile_status = true,
                  path = 4,
                  symbols = {
                     modified = "[+]",
                     readonly = "[-]",
                  },
               },
            },
            lualine_c = {
               "branch",
               "diff",
               "b:gitsigns_status",
            },
            lualine_x = {
               {
                  "diagnostics",
                  sources = { "nvim_workspace_diagnostic" },
                  sections = { "error", "warn", "info", "hint" },
                  --symbols = { error = " ", warn = " ", info = " ", hint = "󰠠 " },
                  colored = true,
                  always_visible = false,
               },
               {
                  lazy_status.updates,
                  cond = lazy_status.has_updates,
                  color = { fg = "#ebcb8b" },
               },
               -- {
               --    function()
               --       return require("auto-session.lib").current_session_name(true)
               --    end,
               -- },
               "encoding",
               "fileformat",
               "filetype",
            },
            lualine_y = { "searchcount", "progress" },
            lualine_z = { "selectioncount", "location" },
         },
         inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = { "filename" },
            lualine_x = {
               {
                  "diagnostics",
                  sources = { "nvim_lsp", "nvim_workspace_diagnostic", "nvim_diagnostic" },
                  sections = { "error", "warn", "info", "hint" },
                  --symbols = { error = " ", warn = " ", info = " ", hint = "󰠠 " },
                  colored = false,
                  always_visible = false,
               },
            },
            lualine_y = {},
            lualine_z = { "location" },
         },
         tabline = {},
         winbar = {},
         inactive_winbar = {},
         extensions = { "nvim-tree", "lazy", "trouble", "quickfix", "fzf", "mason" },
      }
   end,
}
