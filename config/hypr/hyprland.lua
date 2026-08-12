-- Configurations
require("hyprland.animation")
require("hyprland.decoration")
require("hyprland.env")
require("hyprland.general")
require("hyprland.input")
require("hyprland.keybindings")
require("hyprland.misc")
require("hyprland.monitor")
require("hyprland.rules")

-- For Noctalia Color templates
require("noctalia").apply_theme()

require("secrets").load()

-- Startup Apps & Services
hl.on("hyprland.start", function()
	hl.exec_cmd("noctalia")
	hl.exec_cmd("udiskie &")
	hl.exec_cmd("devify &")
end)
