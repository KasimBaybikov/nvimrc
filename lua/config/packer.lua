return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Fuzzy Finder
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.4',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }
  -- Find Functions/Structs in file
  use { "stevearc/aerial.nvim" }

  -- Pretty UI
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

  -- Plugin for the catolog tree
  use {
	  'nvim-tree/nvim-tree.lua',
	  requires = {
		  'nvim-tree/nvim-web-devicons', -- optional
	  },
  }

  -- pretty UI
  use {'stevearc/dressing.nvim'}

  -- autoscale windows
  use { "anuvyklack/windows.nvim",
	  requires = "anuvyklack/middleclass",
  }

  -- Autopairs
  use { "windwp/nvim-autopairs" }

  -- Autocomments
  use { 'numToStr/Comment.nvim' }

  -- Colorscheme
  use { "Mofiqul/dracula.nvim" }

  -- Git
  use{ "lewis6991/gitsigns.nvim" }

  -- LSP
  use {
	  "williamboman/mason.nvim",
	  "williamboman/mason-lspconfig.nvim",
	  'neovim/nvim-lspconfig',
	  'hrsh7th/cmp-nvim-lsp',
	  'hrsh7th/cmp-buffer',
	  'hrsh7th/cmp-path',
	  'hrsh7th/cmp-cmdline',
	  'hrsh7th/nvim-cmp',
	  'L3MON4D3/LuaSnip',
	  'saadparwaiz1/cmp_luasnip',
	  'onsails/lspkind.nvim',
	  'ray-x/lsp_signature.nvim'
  }

end)

