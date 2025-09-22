local wezterm = require("wezterm")
local act = wezterm.action
local config = wezterm.config_builder()

config = {
    color_scheme = "Afterglow", -- Afterglow, Ayu Mirage, MaterialDarker,
    font = wezterm.font_with_fallback {
        "JetBrains Mono",
        "Gen Shin Gothic", },
    font_size = 12,
    default_cursor_style = "SteadyUnderline",
    hide_tab_bar_if_only_one_tab = true,
    line_height = 1.05,
--    window_background_opacity = 0.95,
    use_ime = true,
    front_end = "OpenGL",
--    enable_wayland = true,
    window_padding = {
        left = 10,
        right = 0,
        top = 0,
        bottom = 0,
    },
    check_for_updates = false,
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
            key = 'RightArrow',
            mods = 'ALT',
            action = act.ActivatePaneDirection 'Next',
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
        {
            key = '9',
            mods = "ALT",
            action = act.ShowLauncherArgs { flags = 'FUZZY|WORKSPACES|TABS',
            title = 'Choose a workspace' },
        },
         -- Prompt for a name to use for a new workspace and switch to it.
        {
            key = '8',
            mods = 'ALT',
            action = act.PromptInputLine {
              description = wezterm.format {
                { Attribute = { Intensity = 'Bold' } },
                { Foreground = { AnsiColor = 'Fuchsia' } },
                { Text = 'Enter name for new workspace' },
              },
              action = wezterm.action_callback(function(window, pane, line)
                -- line will be `nil` if they hit escape without entering anything
                -- An empty string if they just hit enter
                -- Or the actual line of text they wrote
                if line then
                  window:perform_action(
                    act.SwitchToWorkspace {
                      name = line,
                    },
                    pane
                  )
                end
              end),
            },
        },
        {
            key = 'UpArrow',
            mods = 'SHIFT',
            action = act.ScrollToPrompt(-1)
        },
        {
            key = 'DownArrow',
            mods = 'SHIFT',
            action = act.ScrollToPrompt(1)
        },
        -- If you would like to use session or workplace in wezterm, uncomment below.
        -- session
        -- {
        --     key = 's',
        --     mods = 'ALT',
        --     action = act({ EmitEvent = "save_session" }),
        -- },
        -- {
        --     key = 'l',
        --     mods = 'ALT',
        --     action = act({ EmitEvent = "load_session" }),
        -- },
        -- {
        --     key = 'r',
        --     mods = 'ALT',
        --     action = act({ EmitEvent = "restore_session" }),
        -- },
        -- {
        --     key = 'd',
        --     mods = 'CTRL|SHIFT',
        --     action = act({ EmitEvent = "delete_session" }),
        -- },
        -- {
        --     key = 'e',
        --     mods = 'CTRL|SHIFT',
        --     action = act({ EmitEvent = "edit_session" }),
        -- },
        -- -- Rename current workspace
        -- {
        --     key = '$',
        --     mods = 'CTRL|SHIFT',
        --     action = act.PromptInputLine {
        --         description = 'Enter new workspace name',
        --         action = wezterm.action_callback(
        --             function(window, pane, line)
        --                 if line then
        --                     wezterm.mux.rename_workspace(wezterm.mux.get_active_workspace(), line)
        --                 end
        --             end
        --         ),
        --     },
        -- },
        -- -- Prompt for a name to use for a new workspace and switch to it.
        -- {
        --     key = 'w',
        --     mods = 'CTRL|SHIFT',
        --     action = act.PromptInputLine {
        --         description = wezterm.format {
        --             { Attribute = { Intensity = 'Bold' } },
        --             { Foreground = { AnsiColor = 'Fuchsia' } },
        --             { Text = 'Enter name for new workspace' },
        --         },
        --         action = wezterm.action_callback(function(window, pane, line)
        --             -- line will be `nil` if they hit escape without entering anything
        --             -- An empty string if they just hit enter
        --             -- Or the actual line of text they wrote
        --             if line then
        --                 window:perform_action(
        --                     act.SwitchToWorkspace {
        --                         name = line,
        --                     },
        --                     pane
        --                 )
        --             end
        --         end),
        --     },
        -- },
    },
}
return config
