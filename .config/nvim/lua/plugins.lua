-- auto install packer if not installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
  return
end

-- add list of plugins to install
return packer.startup(function(use)
   use("wbthomason/packer.nvim")
   use("nvim-lua/plenary.nvim")
   use("rmehri01/onenord.nvim")
   use("christoomey/vim-tmux-navigator")
   use("lewis6991/gitsigns.nvim")
   use("windwp/nvim-autopairs")
   use("nvim-lualine/lualine.nvim")
   use("nvim-tree/nvim-web-devicons")
   use({
      "nvim-treesitter/nvim-treesitter",
      run = function()
         local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
         ts_update()
      end,
   })
   use("tpope/vim-obsession")
   use("norcalli/nvim-colorizer.lua")
   use("seanbreckenridge/gitsigns-yadm") -- bring yadm support back to gitsigns

   use("ThePrimeagen/vim-be-good") -- get gud

  if packer_bootstrap then
    require("packer").sync()
  end
end)
