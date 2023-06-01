local status_ok, ufo = pcall(require, 'ufo')

if not status_ok then
	local snackbar = require 'koeila.utils.snackbar'
	local content = {
		title = 'nvim-ufo',
		type = 'error',
		text = 'Plugin not installed\nFile: koeila.plugins.fold',
	}
	snackbar.show(content)
	return
end

-- set keymaps
require('koeila.keymaps.plugins').set_telescope()

local vim_op = vim.o
vim_op.foldcolumn = '1' -- '0' is not bad
vim_op.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim_op.foldlevelstart = 99
vim_op.foldenable = true

ufo.setup({
    open_fold_hl_timeout = 150,
    close_fold_kinds = {'imports', 'comment'},
    preview = {
        win_config = {
            border = {'', '─', '', '', '', '─', '', ''},
            winhighlight = 'Normal:Folded',
            winblend = 0
        },
        mappings = {
            scrollU = '<C-u>',
            scrollD = '<C-d>',
            jumpTop = '[',
            jumpBot = ']'
        }
    },
    provider_selector = function(bufnr, filetype, buftype)
        return {'treesitter', 'indent'}
    end
})
