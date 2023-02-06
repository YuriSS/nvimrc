vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	use({
		'rose-pine/neovim',
		as = 'rose-pine',
	})
  use { 'ellisonleao/gruvbox.nvim' }
  use 'Mofiqul/dracula.nvim'
  use 'bluz71/vim-nightfly-colors'
  use 'luisiacc/gruvbox-baby'

  use {
		'junegunn/fzf',
		'junegunn/fzf.vim'
	}

	use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

	use('tpope/vim-fugitive')

  use('prettier/vim-prettier', { run = 'yarn install --frozen-lockfile --production' })

  use {
    'mfussenegger/nvim-dap',
    requires = {
      "rcarriga/nvim-dap-ui",
      "nvim-treesitter/nvim-treesitter",
      "theHamsta/nvim-dap-virtual-text",
      "mxsdev/nvim-dap-vscode-js",
    }
  }

  use { 'David-Kunz/jester' }

	use {
		'VonHeikemen/lsp-zero.nvim',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-buffer'},
			{'hrsh7th/cmp-path'},
			{'saadparwaiz1/cmp_luasnip'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'hrsh7th/cmp-nvim-lua'},

			-- Snippets
			{'L3MON4D3/LuaSnip'},
			-- Snippet Collection (Optional)
			{'rafamadriz/friendly-snippets'},
		}
	}

  -- use 'BlackLight/nvim-http'
  use '~/workspace/tests/nvim-http/'

  use {
  "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  }

  use 'tpope/vim-dadbod'
  use 'kristijanhusak/vim-dadbod-ui'
  use 'kristijanhusak/vim-dadbod-completion'
end)
