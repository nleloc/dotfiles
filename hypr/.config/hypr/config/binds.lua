---@diagnostic disable: undefined-global

-- ==========================================
--                 Binds
-- ==========================================

local mainMod = "SUPER"

local fileManager = "dbus-run-session thunar"
local terminal = "kitty"
local browser = "floorp" -- a firefox fork
local btmng = "blueman-manager" -- bluetooth manager

hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd("~/dotfiles/misc/rqs.sh")) -- Restart quickshell
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.exec_cmd("~/dotfiles/misc/rpa.sh")) -- Restart pipewire audio

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
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("qs -c noctalia-shell ipc call lockScreen lock"))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))

-- Bind both super
local function bindBothSuper(mod, action)
	hl.bind(mod .. "+ SUPER_L", action)
	hl.bind(mod .. "+ SUPER_R", action)
end

-- Use both SUPER key to call Noctalia CC
bindBothSuper(mainMod, hl.dsp.exec_cmd("qs -c noctalia-shell ipc call controlCenter toggle"))

--hl.bind(mainMod .. " + SUPER_L", hl.dsp.exec_cmd("qs -c noctalia-shell ipc call controlCenter toggle")) -- Use only left SUPER

hl.bind(mainMod .. " + Menu", hl.dsp.exec_cmd("qs -c noctalia-shell ipc call launcher toggle"))

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
