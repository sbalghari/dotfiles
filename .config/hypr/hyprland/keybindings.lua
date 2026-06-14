-- Variables
local mainMod = "SUPER"
local noctalia_ipc = "noctalia msg"

-----------------------
------ General --------
-----------------------

hl.bind(mainMod .. " + Q ", hl.dsp.window.close(), { description = "Exit The Focused Window" })
hl.bind(mainMod .. " + A ", hl.dsp.window.float({
    action = "toggle"
}), { description = "Toggle Floating Mode" })
hl.bind(mainMod .. " + F ", hl.dsp.window.fullscreen(), { description = "Fullscreen The Active Window" })
hl.bind(mainMod .. " + SHIFT + C ", hl.dsp.exec_cmd(noctalia_ipc .. " wallpaper-random"), {
    description = "Change Wallpaper Randomly"
})
hl.bind(mainMod .. " + SHIFT + W ", hl.dsp.exec_cmd(noctalia_ipc .. " panel-toggle wallpaper"), {
    description = "Toggle Wallpaper Selector"
})
hl.bind(mainMod .. " + SHIFT + R ", hl.dsp.exec_cmd(noctalia_ipc .. " config-reload"), {
    description = "Reload Noctalia's configs"
})
hl.bind(mainMod .. " + CTRL + T ", hl.dsp.exec_cmd(noctalia_ipc .. " bar-toggle"), {
    description = "Toggle Bar"
})
hl.bind(mainMod .. " + SPACE ", hl.dsp.exec_cmd(noctalia_ipc .. " panel-toggle launcher"), {
    description = "Toggle Application Launcher"
})
hl.bind(mainMod .. " + V ", hl.dsp.exec_cmd(noctalia_ipc .. " panel-toggle clipboard"), {
    description = "Toggle Clipboard Manager"
})
hl.bind(mainMod .. " + comma ", hl.dsp.exec_cmd(noctalia_ipc .. " settings-toggle"), {
    description = "Toggle Settings App"
})
hl.bind(mainMod .. " + D ", hl.dsp.exec_cmd(noctalia_ipc .. " panel-toggle control-center"), {
    description = "Toggle Control Center"
})
hl.bind(mainMod .. " + B ", hl.dsp.exec_cmd(noctalia_ipc .. " plugin:keybind-cheatsheet toggle"), {
    description = "Toggle Keybinds Cheatsheet"
})
hl.bind(mainMod .. " + E ", hl.dsp.exec_cmd("nautilus"), {
    description = "Launch File Manager"
})
hl.bind(mainMod .. " + RETURN ", hl.dsp.exec_cmd("kitty"), {
    description = "Launch Kitty Terminal"
})
hl.bind(mainMod .. " + SHIFT + escape ", hl.dsp.exec_cmd("missioncenter"), {
    description = "Launch System Monitor"
})
hl.bind(mainMod .. " + SHIFT + Q ", hl.dsp.exec_cmd(noctalia_ipc .. " panel-toggle session"), {
    description = "Toggle Session Manager"
})

----------------------------------
------ Workspace & window --------
----------------------------------

-- Move Focus To The [Left | Right | Up | Down] Window
hl.bind(mainMod .. " + left ", hl.dsp.focus({
    direction = "left"
}), { description = "Move Focus Left" })

hl.bind(mainMod .. " + right ", hl.dsp.focus({
    direction = "right"
}), { description = "Move Focus Right" })

hl.bind(mainMod .. " + up ", hl.dsp.focus({
    direction = "up"
}), { description = "Move Focus Up" })

hl.bind(mainMod .. " + down ", hl.dsp.focus({
    direction = "down"
}), { description = "Move Focus Down" })

-- [Next | Previous] Non-Empty Workspace
hl.bind(mainMod .. " + Tab ", hl.dsp.focus({
    workspace = "m+1"
}), { description = "Next Non-Empty Workspace" })

hl.bind(mainMod .. " + SHIFT + Tab ", hl.dsp.focus({
    workspace = "m-1"
}), { description = "Previous Non-Empty Workspace" })

-- Switch workspaces - mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({
        workspace = i
    }), { description = "Switch To Workspace " .. i })

    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({
        workspace = i
    }), { description = "Move Active Window To Workspace " .. i })
end

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), {
    mouse = true,
    description = "Move Window With Mouse"
})

hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), {
    mouse = true,
    description = "Resize Window With Mouse"
})

------------------------------
------ Functions keys --------
------------------------------

-- Volume
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(noctalia_ipc .. " volume-up 2"), {
    locked = true,
    repeating = true,
    description = "Increase Volume"
})

hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(noctalia_ipc .. " volume-down 2"), {
    locked = true,
    repeating = true,
    description = "Decrease Volume"
})

hl.bind("XF86AudioMute", hl.dsp.exec_cmd(noctalia_ipc .. " volume-mute"), {
    locked = true,
    repeating = true,
    description = "Mute Output Audio"
})

-- Microphone
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd(noctalia_ipc .. " mic-mute"), {
    locked = true,
    repeating = true,
    description = "Mute Microphone"
})

-- LCD brightness
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(noctalia_ipc .. " brightness-up 5"), {
    locked = true,
    repeating = true,
    description = "Increase Brightness"
})

hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(noctalia_ipc .. " brightness-down 5"), {
    locked = true,
    repeating = true,
    description = "Decrease Brightness"
})

-- Playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd(noctalia_ipc .. " media next"), {
    locked = true,
    description = "Next Media Track"
})

hl.bind("XF86AudioPause", hl.dsp.exec_cmd(noctalia_ipc .. " media pause"), {
    locked = true,
    description = "Pause Media"
})

hl.bind("XF86AudioPlay", hl.dsp.exec_cmd(noctalia_ipc .. " media play"), {
    locked = true,
    description = "Play Media"
})

hl.bind("XF86AudioPrev", hl.dsp.exec_cmd(noctalia_ipc .. " media previous"), {
    locked = true,
    description = "Previous Media Track"
})
