local status_ok, mason_lsp = pcall(require, 'mason-lspconfig')

if not status_ok then
	local content = {
		title = 'Mason-lspconfig',
		type = 'error',
		text = 'Plugin not installed\nFile: koeila.plugins.lsp.mason-config',
	}
	local snackbar = require 'koeila.utils.snackbar'
	snackbar.show(content)
	return
end

return {
	setup = function(ensure_installed)
		mason_lsp.setup({
			ensure_installed = ensure_installed,
		})
	end,
}
