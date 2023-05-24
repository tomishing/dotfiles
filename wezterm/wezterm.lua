local wezterm = require("wezterm")
local act = wezterm.action
local config = {}
if wezterm.config_builder then
  config = wezterm.config_builder()
end
config = {
    color_scheme = "Afterglow", -- Afterglow, Ayu Mirage, MaterialDarker,
    font = wezterm.font_with_fallback {
--        "Fira Code",
        "JetBrains Mono",
--        "JetBrains Mono NL",
--        "Iosevka Term Extended",
--        "Iosevka Term",
        "Gen Shin Gothic", },
    font_size = 12,
    hide_tab_bar_if_only_one_tab = true,
--    line_height = 1.2,
    line_height = 1.1,
--    window_background_opacity = 0.95,
    use_ime = false,
    front_end = "OpenGL",
    window_padding = {
        left = 10,
        right = 0,
        top = 0,
        bottom = 0,
    },
    check_for_updates = true,
    warn_about_missing_glyphs = false,
    leader = { key = 'a', mods = 'CTRL' },
    keys = {
        {
            key = "b",
            mods = "CTRL",
            action = act.DisableDefaultAssignment
        },
        {
            key = "d",
            mods = "CTRL|ALT",
            action = act.SplitVertical { domain = "CurrentPaneDomain" }
        },
        {
            key = "r",
            mods = "CTRL|ALT",
            action = act.SplitHorizontal { domain = "CurrentPaneDomain" }
        },
        {
            key = "b",
            mods = "ALT",
            action = act.RotatePanes("CounterClockwise")
        },
        {
            key = "n",
            mods = "ALT",
            action = act.RotatePanes("Clockwise")
        },
        {
            key = "t",
--            mods = "SHIFT|CTRL",
          mods = "LEADER",
            action = act.SpawnTab("CurrentPaneDomain")
        },
        {
            key = "LeftArrow",
            --mods = "CTRL",
            mods = "LEADER",
            action = act.ActivateTabRelative( -1)
        },
        {
            key = "RightArrow",
            --mods = "CTRL",
            mods = "LEADER",
            action = act.ActivateTabRelative(1)
        },
        {
            key = 'h',
            mods = 'CTRL|ALT',
            action = act.ActivatePaneDirection 'Left',
        },
        {
            key = 'l',
            mods = 'CTRL|ALT',
            action = act.ActivatePaneDirection 'Right',
        },
        {
            key = 'k',
            mods = 'CTRL|ALT',
            action = act.ActivatePaneDirection 'Up',
        },
        {
            key = 'j',
            mods = 'CTRL|ALT',
            action = act.ActivatePaneDirection 'Down',
        },
        {
            key = 'h',
            mods = 'LEADER',
            action = act.AdjustPaneSize { 'Left', 5 },
        },
        {
            key = 'j',
            mods = 'LEADER',
            action = act.AdjustPaneSize { 'Down', 5 },
        },
        {
            key = 'k',
            mods = 'LEADER',
            action = act.AdjustPaneSize { 'Up', 5 }
        },
        {
            key = 'l',
            mods = 'LEADER',
            action = act.AdjustPaneSize { 'Right', 5 },
        },
    },
}
return config
