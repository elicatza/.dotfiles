local fn = vim.fn

-- Install packer.nvim if not exists
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer! Close and reopen nvim."
  vim.cmd [[packadd packer.nvim]]
end

vim.cmd [[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]]

-- Avoid error messages if not install first
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

return packer.startup(function(use)
  use "https://github.com/wbthomason/packer.nvim" -- Packer manages itself

  -- Theme
  use 'morhetz/gruvbox'
  use 'nvim-treesitter/nvim-treesitter'
  use 'feline-nvim/feline.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'lewis6991/gitsigns.nvim'

  --  Markdown
  use 'iamcco/markdown-preview.nvim'

  --  Files
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'

  -- LSP
  use 'neovim/nvim-lspconfig'

  -- Cmp
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'saadparwaiz1/cmp_luasnip'

  -- Snippits
  use 'L3MON4D3/LuaSnip'


  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
