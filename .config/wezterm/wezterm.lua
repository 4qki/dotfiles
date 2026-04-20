-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config.font = wezterm.font("monospace")
config.font_size = 18

config.enable_tab_bar = false

config.color_scheme_dirs = { os.getenv('HOME') .. '/.cache/wal' }
config.color_scheme = 'colors-wezterm'

config.window_background_opacity = 0.9
config.window_close_confirmation = 'NeverPrompt'

-- gpu stuff
config.max_fps = 165
config.front_end = "OpenGL"

-- and finally, return the configuration to wezterm
return config
