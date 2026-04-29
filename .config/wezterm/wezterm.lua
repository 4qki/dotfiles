local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.font = wezterm.font("monospace", { weight = "Regular" } )
config.font_size = 18

config.enable_tab_bar = false

config.color_scheme_dirs = { os.getenv('HOME') .. '/.cache/wal' }
config.color_scheme = 'colors-wezterm'

config.window_close_confirmation = 'NeverPrompt'

local function get_saved_opacity()
  local f = io.open(wezterm.config_dir .. '/opacity_state.txt', 'r')
  if f then
    local val = f:read('*all')
    f:close()
    return tonumber(val)
  end
  return 0.9
end

local function save_opacity(val)
  local f = io.open(wezterm.config_dir .. '/opacity_state.txt', 'w')
  if f then
    f:write(tostring(val))
    f:close()
  end
end

config.window_background_opacity = 0.8

config.keys = {
  {
    key = 't',
    mods = 'CTRL|SHIFT',
    action = wezterm.action_callback(function(window, pane)
      local current_opacity = window:effective_config().window_background_opacity
      local new_opacity

      if current_opacity < 1.0 then
        new_opacity = 1.0
      else
        new_opacity = 0.9
      end
      window:set_config_overrides({
        window_background_opacity = new_opacity,
      })

      save_opacity(new_opacity)
    end),
  },
}

return config
