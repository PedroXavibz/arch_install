local status_ok, notify = pcall(require, 'notify')

if not status_ok then
	local snackbar = require 'koeila.utils.snackbar'
	local content = {
		title = 'Notify',
		type = 'error',
		text = 'Plugin not installed\nFile: koeila.plugins.notify',
	}
	snackbar.show(content)
	return
end

vim.notify = notify
