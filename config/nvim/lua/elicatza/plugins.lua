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
  use 'ellisonleao/gruvbox.nvim'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  }
  use 'feline-nvim/feline.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'lewis6991/gitsigns.nvim'

  use 'tridactyl/vim-tridactyl' -- For trydactyl config
  use 'elkowar/yuck.vim' -- For eww config filetype yuck

  --  Markup
  use 'preservim/vim-markdown'
  use 'iamcco/markdown-preview.nvim'
  use {'nvim-orgmode/orgmode', config = function()
      require('orgmode').setup{}
    end
  }

  --  Files
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- LSP
  use 'neovim/nvim-lspconfig'
  -- https://github.com/simrat39/rust-tools.nvim/

  -- Cmp
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'

  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip'

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
