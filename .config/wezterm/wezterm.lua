--
-- ┬ ┬┌─┐┌─┐┌┬┐┌─┐┬─┐┌┬┐
-- │││├┤ ┌─┘ │ ├┤ ├┬┘│││
-- └┴┘└─┘└─┘ ┴ └─┘┴└─┴ ┴
--

local wezterm = require("wezterm")

local font_name = "Maple Mono NF CN"

local function font_with_fallback(name, params)
	local names = { name }
	return wezterm.font_with_fallback(names, params)
end

return {
	-- OpenGL for GPU acceleration, Software for CPU
	front_end = "OpenGL",

	-- Font config
	font = font_with_fallback(font_name),
	warn_about_missing_glyphs = false,
	font_size = 12,
	line_height = 1.0,

	-- Cursor style
	default_cursor_style = "BlinkingBlock",
	animation_fps = 60,

	-- X11
	enable_wayland = false,

	-- Keybinds
	disable_default_key_bindings = true,
	keys = {
		{
			key = [[\]],
			mods = "CTRL|ALT",
			action = wezterm.action({
				SplitHorizontal = { domain = "CurrentPaneDomain" },
			}),
		},
		{
			key = [[\]],
			mods = "CTRL",
			action = wezterm.action({
				SplitVertical = { domain = "CurrentPaneDomain" },
			}),
		},
		{
			key = "q",
			mods = "CTRL",
			action = wezterm.action({ CloseCurrentPane = { confirm = false } }),
		},
		{
			key = "h",
			mods = "CTRL|SHIFT",
			action = wezterm.action({ ActivatePaneDirection = "Left" }),
		},
		{
			key = "l",
			mods = "CTRL|SHIFT",
			action = wezterm.action({ ActivatePaneDirection = "Right" }),
		},
		{
			key = "k",
			mods = "CTRL|SHIFT",
			action = wezterm.action({ ActivatePaneDirection = "Up" }),
		},
		{
			key = "j",
			mods = "CTRL|SHIFT",
			action = wezterm.action({ ActivatePaneDirection = "Down" }),
		},
		{
			key = "h",
			mods = "CTRL|SHIFT|ALT",
			action = wezterm.action({ AdjustPaneSize = { "Left", 1 } }),
		},
		{
			key = "l",
			mods = "CTRL|SHIFT|ALT",
			action = wezterm.action({ AdjustPaneSize = { "Right", 1 } }),
		},
		{
			key = "k",
			mods = "CTRL|SHIFT|ALT",
			action = wezterm.action({ AdjustPaneSize = { "Up", 1 } }),
		},
		{
			key = "j",
			mods = "CTRL|SHIFT|ALT",
			action = wezterm.action({ AdjustPaneSize = { "Down", 1 } }),
		},
		{ -- browser-like bindings for tabbing
			key = "t",
			mods = "CTRL",
			action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }),
		},
		{
			key = "w",
			mods = "CTRL",
			action = wezterm.action({ CloseCurrentTab = { confirm = false } }),
		},
		{
			key = "Tab",
			mods = "CTRL",
			action = wezterm.action({ ActivateTabRelative = 1 }),
		},
		{
			key = "Tab",
			mods = "CTRL|SHIFT",
			action = wezterm.action({ ActivateTabRelative = -1 }),
		}, -- standard copy/paste bindings
		{
			key = "x",
			mods = "CTRL",
			action = "ActivateCopyMode",
		},
		{
			key = "v",
			mods = "CTRL|SHIFT",
			action = wezterm.action({ PasteFrom = "Clipboard" }),
		},
		{
			key = "c",
			mods = "CTRL|SHIFT",
			action = wezterm.action({ CopyTo = "ClipboardAndPrimarySelection" }),
		},
	},

	-- Catppuccin Mocha Colorscheme
	bold_brightens_ansi_colors = true,
	colors = {
		foreground = "#cdd6f4",
		background = "#1e1e2e",
		cursor_bg = "#f5e0dc",
		cursor_fg = "#11111b",
		cursor_border = "#f5e0dc",
		selection_fg = "#cdd6f4",
		selection_bg = "#585b70",
		scrollbar_thumb = "#585b70",
		split = "#6c7086",
		ansi = {
			"#45475a",
			"#f38ba8",
			"#a6e3a1",
			"#f9e2af",
			"#89b4fa",
			"#f5c2e7",
			"#94e2d5",
			"#bac2de",
		},
		brights = {
			"#585b70",
			"#f38ba8",
			"#a6e3a1",
			"#f9e2af",
			"#89b4fa",
			"#f5c2e7",
			"#94e2d5",
			"#a6adc8",
		},
		indexed = { [16] = "#fab387", [17] = "#f5e0dc" },
		compose_cursor = "#f2cdcd",
		tab_bar = {
			background = "#11111b",
			active_tab = {
				bg_color = "#89b4fa",
				fg_color = "#11111b",
				italic = true,
			},
			inactive_tab = {
				bg_color = "#181825",
				fg_color = "#cdd6f4",
			},
			inactive_tab_hover = {
				bg_color = "#1e1e2e",
				fg_color = "#cdd6f4",
			},
			new_tab = {
				bg_color = "#313244",
				fg_color = "#cdd6f4",
			},
			new_tab_hover = {
				bg_color = "#45475a",
				fg_color = "#cdd6f4",
			},
			inactive_tab_edge = "#313244",
		},
	},

	-- Padding
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},

	-- Tab Bar
	enable_tab_bar = true,
	hide_tab_bar_if_only_one_tab = true,
	use_fancy_tab_bar = false,
	show_new_tab_button_in_tab_bar = false,
	tab_bar_at_bottom = true,

	-- General
	automatically_reload_config = true,
	inactive_pane_hsb = { saturation = 1.0, brightness = 1.0 },
	window_background_opacity = 1.0,
	window_close_confirmation = "NeverPrompt",
	window_decorations = "RESIZE",
}
