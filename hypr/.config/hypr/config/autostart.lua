---@diagnostic disable: undefined-global

-- ==========================================
--              Auto Start
-- ==========================================
hl.on("hyprland.start", function()
	hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
	hl.exec_cmd("hyprctl setcursor Bibata-Modern-Ice 16")
	hl.exec_cmd("vicinae server & kitty")
	hl.exec_cmd("fcitx5 & systemctl --user start hyprpolkitagent & amixer -c 0 set 'Internal Mic Boost' 22%")
	hl.exec_cmd("qs -c caelestia")
end)
