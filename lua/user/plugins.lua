-- PLUGINS
local vim = vim

-- Install packer automatically on first use
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
	vim.cmd[[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.api.nvim_create_autocmd(
	"BufWritePost",
	{
		pattern = { "plugins.lua" },
		command = [[ source <afile> | PackerSync ]]
	}
)

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then return end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

local packer_nvim = function()
	-- Packer managing itself
	use 'wbthomason/packer.nvim'
	-- :help packer

	-- One Dark theme
	-- use 'olimorris/onedarkpro.nvim'
	use({
	  "olimorris/onedarkpro.nvim",
	  config = function()
		local status_ok, onedarkpro = pcall(require, "onedarkpro")
		if status_ok then onedarkpro.setup() end
	  end
	})

	-- LSP
	use 'neovim/nvim-lspconfig'
	use 'williamboman/nvim-lsp-installer'
	-- :help lspconfig

	-- Autocomplete
	use {
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-path',
		'hrsh7th/cmp-cmdline',
		'hrsh7th/nvim-cmp',
		'L3MON4D3/LuaSnip',
		'saadparwaiz1/cmp_luasnip',
		'rafamadriz/friendly-snippets',
	}

	-- Treesitter
	use {
        'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    }-- :help treesitter

	-- FZF (Fuzzy-finder)
	use 'vijaymarupudi/nvim-fzf'
	-- :help fzf

	-- Icons
	use 'kyazdani42/nvim-web-devicons'
	--use 'kyazdani42/nvim-tree.lua'

	-- Lualine
	use 'nvim-lualine/lualine.nvim'
	-- :help lualine

	-- Auto pairs
	use 'windwp/nvim-autopairs'

	-- Highlight hex colors
	use 'norcalli/nvim-colorizer.lua'

	-- Commenting code
	use 'numToStr/Comment.nvim'

	-- Gitsigns
	use 'lewis6991/gitsigns.nvim'

	-- Indent guides
	use 'lukas-reineke/indent-blankline.nvim'

	-- Smooth scrolling
	use 'karb94/neoscroll.nvim'

	-- Automatically set up packer for first time use
	if packer_bootstrap then
		require('packer').sync()
	end
end
local packer_vscode = function()
	use {
        'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
	}
	use 'numToStr/Comment.nvim'
end

if vim.g.vscode then
	return require('packer').startup(packer_vscode)
else
	return require('packer').startup(packer_nvim)
end
