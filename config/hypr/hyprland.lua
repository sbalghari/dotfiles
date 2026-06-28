-- Configurations
require("hyprland.animation")
require("hyprland.decoration")
require("hyprland.enviromentvars")
require("hyprland.general")
require("hyprland.input")
require("hyprland.keybindings")
require("hyprland.misc")
require("hyprland.monitor")
require("hyprland.rules")

-- For Noctalia Color templates
require("noctalia")

-- Startup Apps & Services
hl.on("hyprland.start", function()
    hl.exec_cmd("noctalia")
    hl.exec_cmd("systemctl --user start --now hyprpolkitagent")
    hl.exec_cmd("udiskie &")
    hl.exec_cmd("devify &")
end)
