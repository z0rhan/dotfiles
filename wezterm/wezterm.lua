local wezterm = require 'wezterm'

-- Create a local config table to keep settings organized
local config = wezterm.config_builder()

-- Set font and font size
config.font = wezterm.font("JetBrains Mono")
config.font_size = 12.0

-- Set window transparency
config.window_background_opacity = 0.9

-- Use Gruvbox Dark theme (uncomment if you want it)
config.color_scheme = 'Gruvbox dark, hard (base16)'
config.colors = {
  background = "#090909", -- default dark grayish background
}

-- Wayland disable
-- config.enable_wayland = false

-- Optional: hide title bar decorations
config.window_decorations = "NONE"

-- Set the initial window size
config.initial_rows = 40
config.initial_cols = 160

-- Add keybindings
config.keys = {
  { key = "F11", mods = "NONE", action = wezterm.action.ToggleFullScreen },
  { key = "t", mods = "CTRL", action = wezterm.action.SpawnTab("CurrentPaneDomain") },
}

-- Hide the tab bar when there's only one tab
config.hide_tab_bar_if_only_one_tab = true

-- Blinking cursor
-- config.default_cursor_style = "BlinkingBlock"
-- config.cursor_blink_rate = 350

-- Longer scrollback
config.scrollback_lines = 10000

-- Return the config table
return config

