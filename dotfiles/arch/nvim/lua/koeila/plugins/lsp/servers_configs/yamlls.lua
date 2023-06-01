local status_ok, schemastore = pcall(require, 'schemastore')

if not status_ok then
	local snackbar = require 'koeila.utils.snackbar'
	local content = {
		title = 'Schemastore',
		type = 'error',
		text = 'Plugin not installed\nFile: koeila.plugins.lsp.servers_configs.yamlls',
	}
	snackbar.show(content)
	return
end

return {
	settings = {
		yaml = {
			schemas = schemastore.yaml.schemas(),
		},
	},
}
