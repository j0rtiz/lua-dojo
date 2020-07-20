local wezterm = require "wezterm"
local launch_menu = require "launch_menu"

return {
  launch_menu = launch_menu,
  set_environment_variables = {NODE_ENV = "development"},
  default_prog = {"powershell.exe", "-NoLogo"},
  font = wezterm.font("Fira Code"),
  font_size = 11.0,
  dpi = 96.0,
  hide_tab_bar_if_only_one_tab = true,
  color_scheme = "Firewatch",
  colors = {
    tab_bar = {
      background = "#1e2027",
      active_tab = {
        bg_color = "#3f4056",
        fg_color = "#c0c0c0",
        italic = true
      },
      inactive_tab = {
        bg_color = "#1e2027",
        fg_color = "#3f4056"
      },
      inactive_tab_hover = {
        bg_color = "#3f4056",
        fg_color = "#c0c0c0"
      }
    }
  },
  enable_scroll_bar = true,
  default_cursor_style = "BlinkingBar",
  cursor_blink_rate = 600,
  keys = {
    {key = "f", mods = "CTRL", action = wezterm.action {Search = {CaseInSensitiveString = ""}}},
    {key = "m", mods = "CTRL", action = wezterm.action {SendString = "npm run dev"}},
    {key = "w", mods = "CTRL", action = "CloseCurrentTab"},
    {key = "l", mods = "CTRL", action = "ShowLauncher"}
  }
}
