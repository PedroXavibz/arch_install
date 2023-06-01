local status_ok, code_runner = pcall(require, 'code_runner')

if not status_ok then
	local snackbar = require 'koeila.utils.snackbar'
	local content = {
		title = 'Code_runner',
		type = 'error',
		text = 'Plugin not installed\nFile: koeila.plugins.code-runner',
	}
	snackbar.show(content)
	return
end

require('koeila.keymaps.plugins').set_code_run()

code_runner.setup({
	-- choose default mode (valid term, tab, float, toggle)
	mode = 'float',
	-- Focus on runner window(only works on toggle, term and tab mode)
	focus = true,
	-- startinsert (see ':h inserting-ex')
	startinsert = false,
	insert_prefix = '',
	term = {
		--  Position to open the terminal, this option is ignored if mode ~= term
		position = 'bot',
		-- window size, this option is ignored if mode == tab
		size = 12,
	},
	float = {
		close_key = '<ESC>',
		-- Window border (see ':h nvim_open_win')
		border = 'rounded',

		-- Num from `0 - 1` for measurements
		height = 0.8,
		width = 0.8,
		x = 0.5,
		y = 0.5,

		-- Highlight group for floating window/border (see ':h winhl')
		border_hl = 'FloatBorder',
		float_hl = 'Normal',

		-- Transparency (see ':h winblend')
		blend = 0,
	},
	-- Execute before executing a file
	before_run_filetype = function()
		vim.cmd ':w'
	end,
	prefix = '',
	filetype_path = vim.fn.expand '$NVIM_DIR/lua/koeila/plugins/code-runner/code_runner.json',
	project_path = vim.fn.expand '$NVIM_DIR/lua/koeila/plugins/code-runner/project_manager.json',
})
