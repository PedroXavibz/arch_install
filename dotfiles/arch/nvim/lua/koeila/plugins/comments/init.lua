local status_ok, comment  = pcall(require, 'Comment')

if not status_ok then
	local snackbar = require 'koeila.utils.snackbar'
	local content = {
		title = 'Comment',
		type = 'error',
		text = 'Plugin not installed\nFile: koeila.plugins.comments',
	}
	snackbar.show(content)
	return
end

comment.setup()
