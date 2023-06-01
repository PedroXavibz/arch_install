local status_ok, smartcolumn = pcall(require, 'smartcolumn')

if not status_ok then
	local snackbar = require 'koeila.utils.snackbar'
	local content = {
		title = 'Smartcolumn',
		type = 'error',
		text = 'Plugin not installed\nFile: koeila.plugins.smartcolumn',
	}
	snackbar.show(content)
	return
end

smartcolumn.setup({
	colorcolumn = '80',
	disabled_filetypes = { 'help', 'text', 'markdown' },
	custom_colorcolumn = {},
	scope = 'file',
})
