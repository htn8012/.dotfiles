local wezterm = require("wezterm")
local config = wezterm.config_builder()
local mux = wezterm.mux

config.color_scheme = "Kanagawa (Gogh)"

config.font = wezterm.font_with_fallback({
	"JetBrainsMono Nerd Font",
	"FiraCode Nerd Font",
	"MesloLGS NF",
	"Noto Color Emoji",
})

config.font_size = 11.5
config.cell_width = 1
config.line_height = 1

config.use_fancy_tab_bar = false
config.enable_tab_bar = false
config.tab_bar_at_bottom = false

config.window_close_confirmation = "NeverPrompt"
config.window_decorations = "RESIZE"

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

wezterm.on("gui-startup", function()
	local _, _, window = mux.spawn_window({})
	window:gui_window():maximize()
end)

config.audible_bell = "Disabled"
config.enable_wayland = true
config.warn_about_missing_glyphs = true

return config
