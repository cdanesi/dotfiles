-- set colorscheme if it's installed

-- local status, _ = pcall(vim.cmd, "colorscheme nord")
-- if not status then
--    print("Color scheme not found!")
--    return
-- end

return {
   "shaunsingh/nord.nvim",
   lazy = false,
   priority = 1000,
   config = function()
      vim.cmd([[colorscheme nord]])
   end,
}
