---@diagnostic disable: undefined-global
--  _   _                  _                 _
-- | | | |_   _ _ __  _ __| | __ _ _ __   __| |
-- | |_| | | | | '_ \| '__| |/ _` | '_ \ / _` |
-- |  _  | |_| | |_) | |  | | (_| | | | | (_| |
-- |_| |_|\__, | .__/|_|  |_|\__,_|_| |_|\__,_|
--        |___/|_|
-- I don't have a fucking single knowledge about lua :))
--

-- May cai xam lon truoc
-- ==========================================
--              Color scheme
-- ==========================================
--hl.config.source = {
--	"~/.config/hypr/scheme/current.conf",
--}

-- ==========================================
--                Monitor
-- ==========================================
hl.monitor({
	output = "",
	mode = "1366x768",
	position = "auto",
	scale = "1",
})

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

-- ==========================================
--         Environments + Cursor
-- ==========================================
-- XDG Desktop Portal
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

-- QT
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")

-- GTK
hl.env("GDK_SCALE", "1")
hl.env("GTK_THEME", "nleloc")

-- Mozilla
hl.env("MOZ_ENABLE_WAYLAND", "1")

-- Cursor
hl.env("XCURSOR_SIZE", "24")
hl.env("XCURSOR_THEME", "Bibata-Modern-Ice")

-- Misc
hl.env("APPIMAGELAUNCHER_DISABLE", "1")
hl.env("OZONE_PLATFORM", "wayland")

-- ==========================================
--                  Input
-- ==========================================
hl.config({
	input = {
		kb_layout = "us",
		kb_variant = "",
		kb_model = "",
		kb_options = "compose:ralt",
		kb_rules = "",

		numlock_by_default = true,
		follow_mouse = 1,

		touchpad = {
			natural_scroll = false,
		},
	},
	cursor = {
		no_warps = false,
	},
})

-- ==========================================
--                Look & Feel
-- ==========================================
hl.config({
	general = {
		gaps_in = 3,
		gaps_out = 18,

		border_size = 2,
		col = {
			active_border = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
			inactive_border = "rgba(595959aa)",
		},

		layout = "dwindle",
		resize_on_border = true,
	},

	decoration = {
		rounding = 15,
		blur = {
			enabled = true,
			size = 3,
			passes = 1,
		},
	},

	--	shadow = {
	--		enabled = false,
	--	},
})

-- Animations
--hl.animation({ leaf = "global", enabled = true, speed = 1 })
hl.curve("myBezier", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })

hl.animation({ leaf = "global", enabled = true, speed = 1, bezier = "myBezier" })

hl.animation({ leaf = "windows", enabled = true, speed = 7, bezier = "myBezier" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 7, bezier = "default", style = "popin 80%" })
hl.animation({ leaf = "border", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 8, bezier = "default" })
hl.animation({ leaf = "fade", enabled = true, speed = 7, bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 6, bezier = "default" })

-- ==========================================
--                 Layouts
-- ==========================================
hl.config({
	dwindle = {
		preserve_split = true,
	},
})

-- ==========================================
--                  MISC
-- ==========================================
hl.config({
	misc = {
		disable_hyprland_logo = true, -- If true disables the random hyprland logo / anime girl background. :(
		disable_splash_rendering = true, -- ^ I'll keep this xD ^
	},
	ecosystem = {
		no_update_news = true,
	},
})

-- May cai quan trong o day (chc the)

-- ==========================================
--                 Binds
-- ==========================================

local mainMod = "SUPER"

local fileManager = "thunar"
local terminal = "kitty"
local browser = "firefox"
local btmng = "blueman-manager" -- bluetooth manager

hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd("~/dotfiles/misc/rqs.sh"))

--hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd("vicinae toggle"))
hl.bind(mainMod .. " + G", hl.dsp.exec_cmd(btmng))
hl.bind(mainMod .. " + escape", hl.dsp.exec_cmd("killall wlogout ; wlogout -b5 -c10"))

hl.bind("Print", hl.dsp.exec_cmd("hyprshot -m output -m active -o ~/Pictures/Screenshots/"))
hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd("hyprshot -m region -z -o ~/Pictures/Screenshots/"))

hl.bind(mainMod .. " + F", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("loginctl lock-session"))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))

hl.bind(mainMod .. " + SUPER_L", hl.dsp.exec_cmd("caelestia shell drawers toggle dashboard")) -- Caelestia
hl.bind(mainMod .. " + SUPER_R", hl.dsp.exec_cmd("caelestia shell drawers toggle launcher"))

hl.bind(mainMod .. " + F11", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
hl.bind(mainMod .. " + F12", hl.dsp.dpms({ action = "on" }))
hl.bind(mainMod .. " + SHIFT + F12", hl.dsp.dpms({ action = "off" }))

-- Mouse
hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e-1" }))
hl.bind("SUPER + mouse_up", hl.dsp.focus({ workspace = "e+1" }))

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Workspace
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. " + A", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + D", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + W", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + S", hl.dsp.focus({ direction = "down" }))

-- Sound
--hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
--hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind("Pause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
