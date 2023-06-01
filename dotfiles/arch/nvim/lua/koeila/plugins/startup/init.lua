local status_ok, startup = pcall(require, 'startup')

if not status_ok then
	local snackbar = require 'koeila.utils.snackbar'
	local content = {
		title = 'Startup',
		type = 'error',
		text = 'Plugin not installed\nFile: koeila.plugins.startup',
	}
	snackbar.show(content)
	return
end

startup.setup({
  theme = 'dashboard'
})
