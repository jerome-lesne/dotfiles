-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

config.color_scheme = "Tokyo Night"
config.enable_tab_bar = false
config.font = wezterm.font {
    family = "FiraCode Nerd Font Mono",
    weight = "Medium"
}
config.font_size = 18
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.85
config.macos_window_background_blur = 10
config.window_padding = {
    left = "10px",
    right = 0,
    top = "10px",
    bottom = "10px",
}

return config
