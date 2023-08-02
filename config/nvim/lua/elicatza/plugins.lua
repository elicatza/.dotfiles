
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()


return require('packer').startup(function(use)
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
  use 'eandrju/cellular-automaton.nvim'

  -- use 'tridactyl/vim-tridactyl' -- For trydactyl config
  -- use 'elkowar/yuck.vim' -- For eww config filetype yuck

  --  Markup
  -- use 'preservim/vim-markdown'
  -- use 'iamcco/markdown-preview.nvim'
  use {'nvim-orgmode/orgmode', config = function()
      require('orgmode').setup{}
    end
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- LSP
  use 'neovim/nvim-lspconfig'

  -- Cmp
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'

  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip'
  -- use 'rafamadriz/friendly-snippets'

  -- Git
  use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }

  if packer_bootstrap then
    require("packer").sync()
  end
end)
