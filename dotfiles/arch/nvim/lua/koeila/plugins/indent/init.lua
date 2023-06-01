local status_ok, hlchunk = pcall(require, 'hlchunk')

if not status_ok then
	local snackbar = require 'koeila.utils.snackbar'
	local content = {
		title = 'Hlchunk',
		type = 'error',
		text = 'Plugin not installed\nFile: koeila.plugins.indent',
	}
	snackbar.show(content)
	return
end

hlchunk.setup({
	chunk = {
		chars = {
			horizontal_line = '─',
			vertical_line = '│',
			left_top = '┌',
			left_bottom = '└',
			right_arrow = '─',
		},
		style = '#eaecf7',
	},

	indent = {
		chars = { '|' },

		style = {
			'#373737',
		},
	},

	line_num = {
		style = '#eaecf7',
	},

	blank = {
		enable = false,
		chars = {
			'.',
		},
		style = '#373737',
	},
})
