-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

config.color_scheme = "Tokyo Night"
config.enable_tab_bar = false
config.font = wezterm.font {
    family = "Hack Nerd Font Mono",
}
config.font_size = 19
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.85
config.macos_window_background_blur = 10
config.window_padding = { bottom = 0 }

-- and finally, return the configuration to wezterm
return config
