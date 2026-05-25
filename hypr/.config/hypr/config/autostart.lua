---@diagnostic disable: undefined-global

-- ==========================================
--              Auto Start
-- ==========================================
hl.on("hyprland.start", function()
	hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
	hl.exec_cmd("hyprctl setcursor Bibata-Modern-Ice 16")
	hl.exec_cmd("vicinae server & kitty")
	-- don't ask me why about this
	hl.dispatch(hl.dsp.cursor.move({ x = 1093, y = 576 }))
	--
	hl.exec_cmd("fcitx5 & systemctl --user start hyprpolkitagent & amixer -c 0 set 'Internal Mic Boost' 53%")
	hl.exec_cmd("qs -c caelestia")
end)
