local keymap = require "koeila.utils.keymap"
local term_opts = { silent = true }

vim.g.mapleader = ' '
vim.g.maploalleader = ' '

local keymaps = {
	-- [[ Normal ]]
	n = {
		-- File stuffs [Save, exit]
		['<leader>Q'] = { '<cmd>q<cr>', 'Exit neovim' },
		['<leader>q'] = { '<cmd>bd<cr>', 'Close current buffer' },
		['<C-s>'] = { '<cmd>w<cr>', 'Save file' },

		-- Navigation
		['<Tab>'] = { '<cmd>bnext<cr>', 'Next buffer' },
		['<S-Tab>'] = { '<cmd>bprevious<cr>', 'Previous buffer' },

		['<C-l>'] = { '<C-w>l', 'Focus rigth window' },
		['<C-h>'] = { '<C-w>h', 'Focus left window' },
		['<C-j>'] = { '<C-w>j', 'Focus bottom window' },
		['<C-k>'] = { '<C-w>k', 'Focus up window' },

		['<A-l>'] = { 'g_', 'End line' },
		['<A-h>'] = { '^', 'Begginer line' },

		-- Indent
		['>'] = { '>>', 'Indent ->' },
		['<'] = { '<<', 'Indent <-' },

		-- Stuffs
		['dr'] = { '<C-.>', 'Do last action' },

		['<Esc>'] = { ':noh <CR>', 'Clear highlights' },

		['<F1>'] = { '<cmd>so %<CR>', 'Source nvim' },

		['<F5>'] = { '<cmd>Mason<CR>', 'Open mason' },

		['<leader>l'] = { '<cmd>wincmd w<CR>', 'Docs: Focus floating window' },

		['<leader>s'] = { '<cmd>/<CR>', 'Search' },

		-- line numbers
		['<leader>n'] = { '<cmd> set nu! <CR>', 'Toggle line number' },
		['<leader>nr'] = { '<cmd> set rnu! <CR>', 'Toggle relative number' },

		-- new buffer
		['<leader>b'] = { '<cmd> enew <CR>', 'New buffer' },

		-- Copy | Paste | Cut
		['<leader>x'] = { '"+x', 'Clipboard: Cut' },
		['<leader>y'] = { '"+y', 'Clipboard: Copy' },
		['<leader>p'] = { '"+p', 'Clipboard: Paste' },
		['<leader>P'] = { '"+P', 'Clipboard: Paste' },
	},

	-- [[ Insert ]]
	i = {},

	-- [[ Visual ]]
	v = {
		-- Copy | Paste | Cut
		['<leader>x'] = { '"+x', 'Clipboard: Cut' },
		['<leader>y'] = { '"+y', 'Clipboard: Copy' },
		['<leader>p'] = { '"+p', 'Clipboard: Paste' },
		['<leader>P'] = { '"+P', 'Clipboard: Paste' },

		-- Stuffs
		['<A-l>'] = { 'g_', 'End line' },
		['<A-h>'] = { '^', 'Begginer line' },
		['<A-j>'] = { "<cmd>m '>+1<CR>gv=gv", 'Move text down' },
		['<A-k>'] = { "<cmd>m '<-2<CR>gv=gv", 'Move text up' },

		-- Stay indent mode
		['<'] = { '<gv', 'Visual mode: Indent ->' },
		['>'] = { '>gv', 'Visual mode: Indent ->' },
	},

	-- [[ Visual Block ]]
	x = {
		-- Copy | Paste | Cut
		['<leader>x'] = { '"+x', 'Clipboard: Cut' },
		['<leader>y'] = { '"+y', 'Clipboard: Copy' },
		['<leader>p'] = { '"+p', 'Clipboard: Paste' },
		['<leader>P'] = { '"+P', 'Clipboard: Paste' },

		-- Stuffs
		['<A-l>'] = { 'g_', 'End line' },
		['<A-h>'] = { '^', 'Begginer line' },

		-- Stay indent mode
		['<'] = { '<gv', 'Visual block: Indent ->' },
		['>'] = { '>gv', 'Visual block: Indent ->' },
	},
}

keymap.set(keymaps)

-- Reload init.lua when saving
vim.api.nvim_exec(
	[[
augroup reload_config
  autocmd!
  autocmd BufWritePost $NVIM_DIR/lua/koeila/keymaps/init.lua luafile $NVIM_DIR/lua/koeila/keymaps/init.lua
augroup END
]],
	false
)
