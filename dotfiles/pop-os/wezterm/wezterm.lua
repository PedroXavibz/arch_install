local wezterm = require("wezterm")
local act = wezterm.action
local config = {}

-- [[ Default ]]
config.automatically_reload_config = true

-- [[ UI ]]
-- Font
config.font = wezterm.font("FiraCode Nerd Font")
config.font_size = 12.0

-- Colorscheme
local fav_colors = {
	"aikofog (terminal.sexy)",
	"Vs Code Dark+ (Gogh)",
	"Black Metal (Bathory) (base16)",
}
config.color_scheme = fav_colors[2]

-- Window
--[[ config.initial_rows = 30
config.initial_cols = 110 ]]

-- Tabs
-- config.enable_tab_bar = false
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = false
config.window_decorations = "NONE"

-- [[ Keymaps ]]
config.leader = { key = "b", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
	-- Font [Increase/Decrease]
	{ key = "-", mods = "CTRL", action = wezterm.action.DecreaseFontSize },
	{ key = "=", mods = "CTRL", action = wezterm.action.IncreaseFontSize },
	{ key = "0", mods = "CTRL", action = wezterm.action.ResetFontSize },

	-- Scroll
	{ key = "9", mods = "CTRL", action = act.ScrollByLine(-1) },
	{ key = "0", mods = "CTRL", action = act.ScrollByLine(1) },
	{ key = "PageUp", mods = "SHIFT", action = act.ScrollByPage(-1) },
	{ key = "PageDown", mods = "SHIFT", action = act.ScrollByPage(1) },

	-- Fancy actions
	{ key = "c", mods = "LEADER", action = wezterm.action.ActivateCopyMode },
	{
		key = "r",
		mods = "LEADER",
		action = wezterm.action.SpawnCommandInNewTab({
			args = { "ranger" },
		}),
	},

	-- Panes
	{
		key = "|",
		mods = "LEADER|SHIFT",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "-",
		mods = "LEADER",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "H",
		mods = "LEADER",
		action = act.AdjustPaneSize({ "Left", 5 }),
	},
	{
		key = "J",
		mods = "LEADER",
		action = act.AdjustPaneSize({ "Down", 5 }),
	},
	{ key = "K", mods = "LEADER", action = act.AdjustPaneSize({ "Up", 5 }) },
	{
		key = "L",
		mods = "LEADER",
		action = act.AdjustPaneSize({ "Right", 5 }),
	},

	-- Window
	{
		key = "f",
		mods = "LEADER",
		action = wezterm.action.ToggleFullScreen,
	},

	-- Tabs
	{
		key = "n",
		mods = "LEADER",
		action = act.SpawnTab("CurrentPaneDomain"),
	},
}

-- Tabs
for i = 1, 8 do
	-- CTRL+ALT + number to activate that tab
	table.insert(config.keys, {
		key = tostring(i),
		mods = "ALT",
		action = act.ActivateTab(i - 1),
	})
end

return config
