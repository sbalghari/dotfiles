-- Variables
local mainMod = "SUPER"
local noctalia_ipc = "noctalia msg"

local MAX_ZOOM = 3
local MIN_ZOOM = 1
local ZOOM_TOGGLE_FACTOR = 2

--------------------------------
------ Helper Functions --------
--------------------------------

---@param offset number
---@return nil
local function zoom(offset)
    local current = hl.get_config("cursor.zoom_factor")
    if offset ~= nil then
        current = current + offset
    elseif current ~= MIN_ZOOM then
        current = MIN_ZOOM
    else
        current = ZOOM_TOGGLE_FACTOR
    end
    current = math.max(MIN_ZOOM, math.min(MAX_ZOOM, current))
    hl.config({ cursor = { zoom_factor = current } })
end

local function layout_bind(bind_table)
    return function()
        local workspace = hl.get_active_special_workspace() or
            hl.get_active_workspace()

        if not workspace then
            return
        end

        local layout = workspace.tiled_layout

        if bind_table[layout] then
            hl.dispatch(bind_table[layout])
        end
    end
end

-----------------------
------ Window ---------
-----------------------

hl.bind(mainMod .. " + Q ", hl.dsp.window.close(), {
    description = "Close focused window"
})

hl.bind(mainMod .. " + A ", hl.dsp.window.float({ action = "toggle" }), {
    description = "Toggle floating mode"
})

hl.bind(mainMod .. " + Z ", zoom, {
    description = "Toggle zoom"
})

hl.bind(mainMod .. " + F ", hl.dsp.window.fullscreen(), {
    description = "Toggle fullscreen"
})


-----------------------
------ Focus/Layout ---
-----------------------

hl.bind(mainMod .. " + J ", layout_bind({
    scrolling = hl.dsp.layout("swapcol l"),
    dwindle   = hl.dsp.layout("swapsplit"),
    monocle   = hl.dsp.layout("cycleprev"),
    master    = hl.dsp.layout("cycleprev"),
}), {
    description = "Focus previous window / cycle backward"
})

hl.bind(mainMod .. " + K ", layout_bind({
    scrolling = hl.dsp.layout("swapcol r"),
    dwindle   = hl.dsp.layout("togglesplit"),
    monocle   = hl.dsp.layout("cyclenext"),
    master    = hl.dsp.layout("cyclenext"),
}), {
    description = "Focus next window / cycle forward"
})


-----------------------
------ Apps ----------
-----------------------

hl.bind(mainMod .. " + E ", hl.dsp.exec_cmd("nautilus"), {
    description = "Open file manager"
})

hl.bind(mainMod .. " + RETURN ", hl.dsp.exec_cmd("kitty"), {
    description = "Open terminal"
})

hl.bind(mainMod .. " + SHIFT + escape ", hl.dsp.exec_cmd("missioncenter"), {
    description = "Open system monitor"
})


-----------------------
------ Panels ---------
-----------------------

hl.bind(mainMod .. " + SPACE ", hl.dsp.exec_cmd(noctalia_ipc .. " panel-toggle launcher"), {
    description = "Toggle application launcher"
})

hl.bind(mainMod .. " + V ", hl.dsp.exec_cmd(noctalia_ipc .. " panel-toggle clipboard"), {
    description = "Toggle clipboard manager"
})

hl.bind(mainMod .. " + D ", hl.dsp.exec_cmd(noctalia_ipc .. " panel-toggle control-center"), {
    description = "Toggle control center"
})

hl.bind(mainMod .. " + SHIFT + Q ", hl.dsp.exec_cmd(noctalia_ipc .. " panel-toggle session"), {
    description = "Toggle session menu"
})

hl.bind(mainMod .. " + B ", hl.dsp.exec_cmd(noctalia_ipc .. " plugin:keybind-cheatsheet toggle"), {
    description = "Toggle keybind cheatsheet"
})


-----------------------
------ System ---------
-----------------------

hl.bind(mainMod .. " + T ", hl.dsp.exec_cmd(noctalia_ipc .. " bar-toggle"), {
    description = "Toggle bar"
})

hl.bind(mainMod .. " + SHIFT + W ", hl.dsp.exec_cmd(noctalia_ipc .. " panel-toggle wallpaper"), {
    description = "Toggle wallpaper selector"
})

hl.bind(mainMod .. " + SHIFT + C ", hl.dsp.exec_cmd(noctalia_ipc .. " wallpaper-random"), {
    description = "Random wallpaper"
})

hl.bind(mainMod .. " + SHIFT + R ", hl.dsp.exec_cmd(noctalia_ipc .. " config-reload"), {
    description = "Reload configuration"
})

hl.bind(mainMod .. " + comma ", hl.dsp.exec_cmd(noctalia_ipc .. " settings-toggle"), {
    description = "Toggle settings app"
})

-------------------------------
------ Media Controls ---------
-------------------------------

hl.bind(mainMod .. " + bracketright ", hl.dsp.exec_cmd(noctalia_ipc .. " media next"), {
    locked = true,
    description = "Next Media Track"
})

hl.bind(mainMod .. " + P ", hl.dsp.exec_cmd(noctalia_ipc .. " media toggle"), {
    locked = true,
    description = "Pause Media"
})

hl.bind(mainMod .. " + bracketleft ", hl.dsp.exec_cmd(noctalia_ipc .. " media previous"), {
    locked = true,
    description = "Previous Media Track"
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

-- Media
-- hl.bind("XF86AudioNext", hl.dsp.exec_cmd(noctalia_ipc .. " media next"), {
--     locked = true,
--     description = "Next Media Track"
-- })

-- hl.bind("XF86AudioPause", hl.dsp.exec_cmd(noctalia_ipc .. " media pause"), {
--     locked = true,
--     description = "Pause Media"
-- })

-- hl.bind("XF86AudioPlay", hl.dsp.exec_cmd(noctalia_ipc .. " media play"), {
--     locked = true,
--     description = "Play Media"
-- })

-- hl.bind("XF86AudioPrev", hl.dsp.exec_cmd(noctalia_ipc .. " media previous"), {
--     locked = true,
--     description = "Previous Media Track"
-- })
