-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- wezterm.mux module manages the multiplexer layer (panes, tabs, windows, and workspaces)
local mux = wezterm.mux

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'Default (dark) (terminal.sexy)'

config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true
config.enable_scroll_bar = true
config.scrollback_lines = 100000

config.default_cursor_style = "BlinkingBlock"

config.window_background_opacity = 0.9

config.inactive_pane_hsb = {
    saturation = 0.8,
    brightness = 0.7,
}

-- Mazimize window  on startup
wezterm.on('gui-startup', function(window)
   local tab, pane, window = mux.spawn_window(cmd or {})
   local gui_window = window:gui_window();
   gui_window:maximize()
end)

-- Set the default working dir if it exist
config.default_cwd = (wezterm.home_dir .. '/Git')

-- and finally, return the configuration to wezterm
return config

