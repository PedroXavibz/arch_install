local status_ok, flutter = pcall(require, 'flutter-tools')

if not status_ok then
	local snackbar = require 'koeila.utils.snackbar'
	local content = {
		title = 'flutter-tools',
		type = 'error',
		text = 'Plugin not installed\nFile: koeila.plugins.flutter',
	}
	snackbar.show(content)
	return
end

local lsp_handler = require 'koeila.plugins.lsp.handle'

flutter.setup({
	ui = {
		border = 'rounded',
		notification_style = 'native',
	},
	decorations = {
		statusline = {
			app_version = true,
			device = true,
		},
	},
	widget_guides = {
		enabled = true,
	},
	closing_tags = {
		highlight = 'ErrorMsg',
		prefix = '//',
		enabled = true,
	},
	flutter_path = vim.fn.expand '$FLUTTER_BIN/flutter',
	lsp = {
		color = {
			enabled = false,
			background = false,
			foreground = false,
			virtual_text = true,
			virtual_text_str = '■',
		},
		settings = {
			showTodos = true,
			completeFunctionCalls = true,
			enableSnippets = true,
		},
		on_attach = lsp_handler.on_attach,
		capabilities = lsp_handler.capabilities,
	},
	debugger = {
		enabled = false,
		run_via_dap = false,
	},
	dev_log = {
		enabled = true,
		open_cmd = 'tabedit', -- command to use to open the log buffer
	},
})
