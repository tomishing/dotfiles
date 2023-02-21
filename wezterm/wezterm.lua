
local wezterm = require 'wezterm'
local act = wezterm.action

return {
--    default_prog = {"/usr/bin/zsh", "-l"},
--    color_scheme = "OneHalfDark", -- Afterglow, Ayu Mirage, MaterialDarker,
    --color_scheme = "nord", -- Afterglow, Ayu Mirage, MaterialDarker,
--    color_scheme = "Mariana", -- Afterglow, Ayu Mirage, MaterialDarker,
    color_scheme = "Afterglow", -- Afterglow, Ayu Mirage, MaterialDarker,
    -- font = wezterm.font("FirgeNerd Console", {weight="Regular", stretch="Normal"}),
--    font = wezterm.font("Firge35Nerd", {weight="Regular", stretch="Normal"}),
    font = wezterm.font_with_fallback {
        'Firge35Nerd Console',
        'FiraCode Nerd Font Mono',
    },
    font_size = 11,
    keys = {
        {
            key = "b", 
            mods = "CTRL", 
            action = wezterm.action.DisableDefaultAssignment
        },
        {
            key = "d", 
            mods = "CTRL|ALT", 
            action = act.SplitVertical{domain = "CurrentPaneDomain"}
        },
        {
            key="r", 
            mods="CTRL|ALT", 
            action=act.SplitHorizontal{domain="CurrentPaneDomain"}
        },
        {
            key="b", 
            mods="ALT", 
            action=act.RotatePanes("CounterClockwise")
        },
        {
            key="n", 
            mods="ALT", 
            action=act.RotatePanes("Clockwise")
        },
        {
            key="t", 
            mods="SHIFT|CTRL", 
            action=act.SpawnTab("CurrentPaneDomain")
        },
        {
            key="PageUp",
            mods="CTRL",
            action=act.ActivateTabRelative(-1)
        },
        {
            key="PageDown", 
            mods="CTRL",
            action=act.ActivateTabRelative(1)
        },
        {
            key = 'LeftArrow',
            mods = 'CTRL|SHIFT',
            action = act.ActivatePaneDirection 'Left',
        },
        {
            key = 'RightArrow',
            mods = 'CTRL|SHIFT',
            action = act.ActivatePaneDirection 'Right',
        },
        {
            key = 'UpArrow',
            mods = 'CTRL|SHIFT',
            action = act.ActivatePaneDirection 'Up',
        },
        {
            key = 'DownArrow',
            mods = 'CTRL|SHIFT',
            action = act.ActivatePaneDirection 'Down',
        },
        },
    hide_tab_bar_if_only_one_tab = true,
    line_height = 1.1,
--    window_background_opacity = 0.95,
    use_ime = true,

    window_padding = {
        left = 10,
        right = 0,
        top = 0,
        bottom = 0,
    },
}
