local function get_colorschemes()
	local results = {}
	for _, path in ipairs(vim.api.nvim_get_runtime_file('colors/*.vim', true)) do
		local name = string.match(path, 'colors/(.+).vim')
		table.insert(results, name)
	end
	return results
end

return {
	change = function()
		require('telescope.builtin').colorscheme({ enable_preview = true, disable_devicons = true })
	end,
}
