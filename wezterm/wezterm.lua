
local wezterm = require 'wezterm'
local act = wezterm.action

return {
--    default_prog = {"/usr/bin/zsh", "-l"},
--    color_scheme = "OneHalfDark", -- Afterglow, Ayu Mirage, MaterialDarker,
    --color_scheme = "nord", -- Afterglow, Ayu Mirage, MaterialDarker,
    color_scheme = "Mariana", -- Afterglow, Ayu Mirage, MaterialDarker,
--    color_scheme = "Afterglow", -- Afterglow, Ayu Mirage, MaterialDarker,
    -- font = wezterm.font("FirgeNerd Console", {weight="Regular", stretch="Normal"}),
    font = wezterm.font("Firge35Nerd Console", {weight="Regular", stretch="Normal"}),
    font_size = 11,
    keys = {
        {key="b", mods="CTRL", action=wezterm.action.DisableDefaultAssignment},
        {key="d", mods="CTRL|ALT", action=act.SplitVertical{domain="CurrentPaneDomain"}},
        {key="r", mods="CTRL|ALT", action=act.SplitHorizontal{domain="CurrentPaneDomain"}},
        {key="b", mods="ALT", action=act.RotatePanes("CounterClockwise")},
        {key="n", mods="ALT", action=act.RotatePanes("Clockwise")},
        {key="t", mods="SHIFT|CTRL", action=act.SpawnTab("CurrentPaneDomain")},
        {key="PageUp", mods="CTRL", action=act.ActivateTabRelative(-1)},
        {key="PageDown", mods="CTRL", action=act.ActivateTabRelative(1)},
    },
    hide_tab_bar_if_only_one_tab = true,
    line_height = 1.1,
--    window_background_opacity = 0.95,
    use_ime = true,
}
