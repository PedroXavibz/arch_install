local status_ok, mason_null = pcall(require, 'mason-null-ls')

if not status_ok then
	local snackbar = require 'koeila.utils.snackbar'
	local content = {
		title = 'Mason-null-ls',
		type = 'error',
		text = 'Plugin not installed\nFile: koeila.plugins.null.mason_null-ls',
	}
	snackbar.show(content)
	return
end

return {
	setup = function(ensure_installed)
		mason_null.setup({
			ensure_installed = ensure_installed,
			automatic_installation = false,
		})
	end,
}
