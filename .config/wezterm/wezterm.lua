local wezterm = require("wezterm")
local config = wezterm.config_builder()
local mux = wezterm.mux

wezterm.on("gui-startup", function()
	local tab, pane, window = mux.spawn_window({})
	window:gui_window():maximize()
end)

config = {
	term = "xterm-256color",
	enable_kitty_graphics = true,
	max_fps = 60,
	color_scheme = "nord",
	window_decorations = "RESIZE",
	enable_tab_bar = false,
	default_cursor_style = "SteadyBlock",
	cursor_blink_ease_out = "Constant",
	cursor_blink_ease_in = "Constant",
	cursor_blink_rate = 0,
	font = wezterm.font("JetBrainsMono Nerd Font"),
	font_size = 14,
	window_background_opacity = 0.6,
	macos_window_background_blur = 15,
	window_padding = {
		left = 2,
		right = 2,
		top = 7,
		bottom = 0,
	},
}

return config
