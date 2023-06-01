local status_ok, fidget = pcall(require, 'fidget')

if not status_ok then
	local snackbar = require 'koeila.utils.snackbar'
	local content = {
		title = 'Fidget',
		type = 'error',
		text = 'Plugin not installed\nFile: koeila.plugins.fidget',
	}
	snackbar.show(content)
	return
end

fidget.setup()
