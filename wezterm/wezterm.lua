local wezterm = require("wezterm")
local act = wezterm.action
local config = wezterm.config_builder()

config.color_scheme = "Afterglow"
config.font = wezterm.font_with_fallback {
  "JetBrains Mono",
  "Gen Shin Gothic",
}
config.font_size = 12
config.default_cursor_style = "SteadyUnderline"
config.hide_tab_bar_if_only_one_tab = true
config.line_height = 1.05
-- config.window_background_opacity = 0.95
config.use_ime = true
config.front_end = "OpenGL"
-- config.front_end = "WebGpu"
config.enable_wayland = true
config.window_padding = {
  left = 10,
  right = 0,
  top = 0,
  bottom = 0,
}
config.check_for_updates = false
config.warn_about_missing_glyphs = false
config.leader = { key = 'a', mods = 'CTRL' }

config.keys = {
  {
    key = "b",
    mods = "CTRL",
    action = act.DisableDefaultAssignment,
  },
  {
    key = "d",
    mods = "CTRL|ALT",
    action = act.SplitVertical { domain = "CurrentPaneDomain" },
  },
  {
    key = "r",
    mods = "CTRL|ALT",
    action = act.SplitHorizontal { domain = "CurrentPaneDomain" },
  },
  {
    key = "b",
    mods = "ALT",
    action = act.RotatePanes("CounterClockwise"),
  },
  {
    key = "n",
    mods = "ALT",
    action = act.RotatePanes("Clockwise"),
  },
  {
    key = "t",
    mods = "LEADER",
    action = act.SpawnTab("CurrentPaneDomain"),
  },
  {
    key = "LeftArrow",
    mods = "LEADER",
    action = act.ActivateTabRelative(-1),
  },
  {
    key = "RightArrow",
    mods = "LEADER",
    action = act.ActivateTabRelative(1),
  },
  {
    key = "RightArrow",
    mods = "ALT",
    action = act.ActivatePaneDirection "Next",
  },
  {
    key = "h",
    mods = "CTRL|ALT",
    action = act.ActivatePaneDirection "Left",
  },
  {
    key = "l",
    mods = "CTRL|ALT",
    action = act.ActivatePaneDirection "Right",
  },
  {
    key = "k",
    mods = "CTRL|ALT",
    action = act.ActivatePaneDirection "Up",
  },
  {
    key = "j",
    mods = "CTRL|ALT",
    action = act.ActivatePaneDirection "Down",
  },
  {
    key = "h",
    mods = "LEADER",
    action = act.AdjustPaneSize { "Left", 5 },
  },
  {
    key = "j",
    mods = "LEADER",
    action = act.AdjustPaneSize { "Down", 5 },
  },
  {
    key = "k",
    mods = "LEADER",
    action = act.AdjustPaneSize { "Up", 5 },
  },
  {
    key = "l",
    mods = "LEADER",
    action = act.AdjustPaneSize { "Right", 5 },
  },
  {
    key = "9",
    mods = "ALT",
    action = act.ShowLauncherArgs {
      flags = "FUZZY|WORKSPACES|TABS",
      title = "Choose a workspace",
    },
  },
  {
    key = "8",
    mods = "ALT",
    action = act.PromptInputLine {
      description = wezterm.format {
        { Attribute = { Intensity = "Bold" } },
        { Foreground = { AnsiColor = "Fuchsia" } },
        { Text = "Enter name for new workspace" },
      },
      action = wezterm.action_callback(function(window, pane, line)
        if line then
          window:perform_action(
            act.SwitchToWorkspace { name = line },
            pane
          )
        end
      end),
    },
  },
  {
    key = "UpArrow",
    mods = "SHIFT",
    action = act.ScrollToPrompt(-1),
  },
  {
    key = "DownArrow",
    mods = "SHIFT",
    action = act.ScrollToPrompt(1),
  },
}

return config

