local status_ok, numb = pcall(require, 'numb')

if not status_ok then
	local snackbar = require 'koeila.utils.snackbar'
	local content = {
		title = 'Numb',
		type = 'error',
		text = 'Plugin not installed\nFile: koeila.plugins.numb',
	}
	snackbar.show(content)
	return
end

numb.setup()
