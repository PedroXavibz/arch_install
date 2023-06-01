local status_ok, lspconfig = pcall(require, 'lspconfig')

if not status_ok then
	local content = {
		title = 'Lspconfig',
		type = 'error',
		text = 'Plugin not installed\nFile: koeila.plugins.lsp',
	}
	local snackbar = require 'koeila.plugins.lsp.lspconfig'
	snackbar.show(content)
	return
end

local lsp_handler = require 'koeila.plugins.lsp.handle'

lsp_handler.setup()

local opts = {
	on_attach = lsp_handler.on_attach,
	capabilities = lsp_handler.capabilities,
	flags = {
		debounce_text_changes = 150,
	},
}

return {
	setup = function(servers)
		for _, server in pairs(servers) do
			if server == 'lua_ls' then
        local lua_opts = require 'koeila.plugins.lsp.servers_configs.lua_ls'
        opts = vim.tbl_deep_extend('force', lua_opts, opts)
			end

			if server == 'jsonls' then
        local jsonls_opts = require 'koeila.plugins.lsp.servers_configs.jsonls'
        opts = vim.tbl_deep_extend('force', jsonls_opts, opts)
			end

			if server == 'yamlls' then
        local yamlls_opts = require 'koeila.plugins.lsp.servers_configs.yamlls'
        opts = vim.tbl_deep_extend('force', yamlls_opts, opts)
			end

			lspconfig[server].setup(opts)
		end
	end,
}
