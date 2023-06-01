local fn = vim.fn
local INSTALL_PATH = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

local is_present, packer = pcall(require, 'packer')
if not is_present and fn.empty(fn.glob(INSTALL_PATH)) > 0 then
	-- Install packer.nvim
	PACKER_BOOTSTRAP = fn.system({
		'git',
		'clone',
		'--depth',
		'1',
		'https://github.com/wbthomason/packer.nvim',
		INSTALL_PATH,
	})

	-- Check for installation
	vim.cmd [[packadd packer.nvim]]

	is_present, packer = pcall(require, 'packer')
	if is_present then
		vim.notify('packer.nvim installation successful.', vim.log.levels.INFO)
	else
		vim.notify('packer.nvim installation failed.', vim.log.levels.ERROR)
		return
	end
end

vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost */lua/koeila/packer/init.lua source <afile> | PackerCompile
  augroup end
]]

packer.init({
	max_jobs = 8,
	compile_path = fn.stdpath 'config' .. '/plugin/packer_compiled.lua', -- for impatient caching
	display = {
		open_fn = function()
			return require('packer.util').float({ border = 'rounded' })
		end,
	},
	auto_clean = true,
	compile_on_sync = true,
	autoremove = true,
})

return packer.startup(function(use)
	-- NOTE: [[ PACKER STUFFS 📦 ]]
	-- Have packer manage itself
	use 'wbthomason/packer.nvim'

	-- An implementation of the Popup API from vim in Neovim
	use 'nvim-lua/popup.nvim'

	-- Useful lua functions used ny lots of plugins
	use 'nvim-lua/plenary.nvim'

	-- Improve startup time for Novim
	use({
		'lewis6991/impatient.nvim',
		config = function()
			require 'impatient'
		end,
	})

	-- This is needed to fix lsp doc highlight
	use({
		'antoinemadec/FixCursorHold.nvim',
		config = function()
			require('impatient').enable_profile()
		end,
	})

	-- SQLite LuaJIT binding with a very simple api.
	use({ 'kkharji/sqlite.lua' })
	-- ▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋

	-- NOTE: [[ COLORSCHEMES 🎨 ]]
	use({
		'Mofiqul/vscode.nvim',
		'tomasiser/vim-code-dark',
		'marko-cerovac/material.nvim',
		'nyoom-engineering/oxocarbon.nvim',
		'olimorris/onedarkpro.nvim',
		'jdsimcoe/hyper.vim',
		'rebelot/kanagawa.nvim',
		{ 'Everblush/nvim', as = 'everblush' },
	})

	-- ▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋

	-- NOTE: [[ UI 💡]]
	-- This plugin provides the same icons as well as colors for each icon.
	use 'nvim-tree/nvim-web-devicons'

	-- Component Library for Neovim.
	use 'MunifTanjim/nui.nvim'

	-- A neovim lua plugin to help easily manage multiple terminal windows
	use({
		'akinsho/toggleterm.nvim',
		config = function()
			require 'koeila.plugins.terminal'
		end,
	})

	-- Better UI neovim
	use({
		'stevearc/dressing.nvim',
		config = function()
			require 'koeila.plugins.dressing'
		end,
	})

	-- Plugin that completely replaces the UI for messages, cmdline and the
	-- popupmenu.
	use({
		'folke/noice.nvim',
		config = function()
			require 'koeila.plugins.noice'
		end,
	})

	-- A fancy, configurable, notification manager for NeoVim
	use({
		'rcarriga/nvim-notify',
		config = function()
			require 'koeila.plugins.notify'
		end,
	})

	-- A highly configurable neovim startup screen
	use({
		'startup-nvim/startup.nvim',
		config = function()
			require 'koeila.plugins.startup'
		end,
	})

	-- A bufferline for Neovim
	use({
		'akinsho/bufferline.nvim',
		config = function()
			require 'koeila.plugins.tabline'
		end,
	})

	-- A Neovim plugin hiding your colorcolumn when unneeded.
	use({
		'm4xshen/smartcolumn.nvim',
		config = function()
			require 'koeila.plugins.smartcolumn'
		end,
	})

	--  Highlight colors for neovim
	use({
		'brenoprata10/nvim-highlight-colors',
		config = function()
			require 'koeila.plugins.highlight'
		end,
	})

	-- A modern and useful UI plugin that wraps lsp operations.
	use({
		'jinzhongjia/LspUI.nvim',
		event = 'VimEnter',
		config = function()
			require 'koeila.plugins.lsp.lsp-ui'
		end,
	})

	-- Standalone UI for nvim-lsp progress
	use({
		'j-hui/fidget.nvim',
		config = function()
			require 'koeila.plugins.fidget'
		end,
	})

	-- A performant lsp progress status for Neovim.
	use 'linrongbin16/lsp-progress.nvim'

	-- A VS Code like winbar for Neovim
	use({
		'utilyre/barbecue.nvim',
		tag = '*',
		requires = {
			'SmiteshP/nvim-navic',
			'nvim-tree/nvim-web-devicons', -- optional dependency
		},
		config = function()
			require 'koeila.plugins.barbecue'
		end,
	})

	-- Neovim statusline
	use({
		'nvim-lualine/lualine.nvim',
		config = function()
			require 'koeila.plugins.statusline'
		end,
	})
	-- ▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋

	-- NOTE: [[ FUZZY FINDER 🔭 | FILE EXPLORE 🌲 ]]
	-- Plugin to manage the file system and other tree like structures.
	use({
		'nvim-neo-tree/neo-tree.nvim',
		branch = 'v2.x',
		config = function()
			require 'koeila.plugins.neotree'
		end,
	})

	-- Find, Filter, Preview, Pick. All lua, all the time.
	use 'nvim-telescope/telescope-fzf-native.nvim'
	use 'nvim-telescope/telescope-frecency.nvim'
	use 'nvim-telescope/telescope-fzf-writer.nvim'
	use({
		'nvim-telescope/telescope.nvim',
		tag = '0.1.1',
		config = function()
			require 'koeila.plugins.telescopefd'
		end,
	})
	-- ▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋

	-- NOTE: [[ LSP | CMP | SNIPPETS | DEBUG | LINTER | FORMATTER 🚬 ]]
	-- Lsp
	use 'neovim/nvim-lspconfig'
	use 'williamboman/mason-lspconfig.nvim'
	use 'ray-x/lsp_signature.nvim'

	-- CMP
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'lukas-reineke/cmp-under-comparator'
	use({
		'hrsh7th/nvim-cmp',
		config = function()
			require 'koeila.plugins.cmp'
		end,
	})

	-- Snippets
	use 'L3MON4D3/LuaSnip'
	use 'saadparwaiz1/cmp_luasnip'

	-- Schemas
	use 'b0o/schemastore.nvim'

	-- Debug
	use 'mfussenegger/nvim-dap'

	-- Linter / formatter
  use 'jay-babu/mason-null-ls.nvim'
	use 'jose-elias-alvarez/null-ls.nvim'

	-- Full signature help, docs and completion for the nvim lua API
	use({
		'folke/neodev.nvim',
		config = function()
			require 'koeila.plugins.neodev'
		end,
	})

	-- Easily manage external editor tooling such as LSP servers, DAP servers, linters, and formatters
	use({
		'williamboman/mason.nvim',
		run = ':MasonUpdate',
		config = function()
			require 'koeila.plugins.mason'
			require 'koeila.plugins.lsp'
			require 'koeila.plugins.null-ls'
		end,
	})
	-- ▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋

	-- NOTE: [[ LANGUAGE STUFFS 🧩 ]]
	-- Coments
	use({
		'numToStr/Comment.nvim', -- Smart and powerful comment plugin for neovim.
		config = function()
			require 'koeila.plugins.comments'
		end,
	})

	-- ReactJS commment
	use 'JoosepAlviste/nvim-ts-context-commentstring'

	-- Todo comment highlight
	use({
		'folke/todo-comments.nvim',
		config = function()
			require 'koeila.plugins.comments.todo'
		end,
	})

	-- Auto close and auto rename html tag
	use 'windwp/nvim-ts-autotag'

	-- Indent
	use({
		'shellRaining/hlchunk.nvim',
		config = function()
			require 'koeila.plugins.indent'
		end,
	})

	-- Rainbow parentheses
	use 'mrjones2014/nvim-ts-rainbow'

	-- Virtual text context
	use 'haringsrob/nvim_context_vt'

	-- Flutter
	use ({'akinsho/flutter-tools.nvim',
    config = function()
      require 'koeila.plugins.flutter'
    end
  })

	-- Peek lines just when you intend
	use({
		'nacro90/numb.nvim',
		config = function()
			require 'koeila.plugins.numb'
		end,
	})

	-- Fold in Neovim
	use({
		'kevinhwang91/nvim-ufo',
		requires = 'kevinhwang91/promise-async',
		config = function()
			require 'koeila.plugins.fold'
		end,
	})

	-- Treesitter
	use({
		'nvim-treesitter/nvim-treesitter',
		run = {
			':TSUpdate',
		},
		config = function()
			require 'koeila.plugins.treesitter'
		end,
	})

	-- Code runner
	use({
		'CRAG666/code_runner.nvim',
		config = function()
			require 'koeila.plugins.code-runner'
		end,
	})
	-- ▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋

	-- NOTE: [[ GIT | GITHUB 🐙]]
	use({
		'lewis6991/gitsigns.nvim',
		config = function()
			require 'koeila.plugins.git'
		end,
	})
	-- ▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋▋

	-- Automatically set up your configuration after cloning packer.nvim
	if PACKER_BOOTSTRAP then
		require('packer').sync()
	end
end)
