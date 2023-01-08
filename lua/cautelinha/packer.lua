vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	use({
		'rose-pine/neovim',
		as = 'rose-pine',
	})

  use {
		'junegunn/fzf',
		'junegunn/fzf.vim'
	}

	use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

	use('tpope/vim-fugitive')

  use('prettier/vim-prettier', { run = 'yarn install --frozen-lockfile --production' })

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
end)
