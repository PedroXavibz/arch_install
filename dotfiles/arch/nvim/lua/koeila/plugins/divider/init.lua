local status_ok, divider = pcall(require, 'divider')

if not status_ok then
	local snackbar = require 'koeila.utils.snackbar'
	local content = {
		title = 'Divider',
		type = 'error',
		text = 'Plugin not installed\nFile: koeila.plugins.divider',
	}
	snackbar.show(content)
	return
end

divider.setup({
	dividers = {
		{
			-- regex used to match dividers
			-- this is passed to rg command
			divider_regex = [[%%=+ [\s\S]+ =+%%]],
			-- regex used to match content of each divider
			-- this is used by lua function string.match
			content_regex = [[%%%%=+ ([%s%S]*) =+%%%%]],
			-- highlight color
			hl = '#ff00ff',
			-- icon (string | nil)
			icon = '',
			-- icon color (string | nil)
			icon_hl = '#ffff00',
			-- whether to show in list (boolean | nil)
			hide = false,
		},
		{
			divider_regex = [[%%-+ [\s\S]+ -+%%]],
			content_regex = [[%%%%%-+ ([%s%S]*) %-+%%%%]],
			hl = '#ffff00',
			icon = '',
		},
		{
			divider_regex = [[%% [\s\S]+ %%]],
			content_regex = [[%%%% ([%s%S]*) %%%%]],
			hl = '#00ff7c',
			icon = '',
		},
	},
	enabled_filetypes = { 'lua' },
	-- whether to highlight current divider in divider panel
	highlight_current_divider = true,
	-- background color of current divider
	current_divider_hl = '#0083a7',
	ui = {
		-- 'vl'|'vr'|'ht'|'hb'
		direction = 'vr',
		size = 40,
		enter = false,
	},
})
