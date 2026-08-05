---@diagnostic disable: undefined-global

-- ==========================================
--               Misc script
-- ==========================================

local M = {}

-- restart QuickShell ( Noctalia )
function M.rs_quickshell()
	return hl.dsp.exec_cmd([[
        bash -c '
        killall -q noctalia
        while pgrep -u $USER -x "noctalia" >/dev/null; do sleep 0.1; done
        noctalia &
        disown -a
        '
    ]])
end

-- restart Pipewire, yeah i don't have Systemd :)
function M.rs_pipewire()
	return hl.dsp.exec_cmd([[
        bash -c '
        killall -q pipewire wireplumber pipewire-pulse
        while pgrep -u $USER -x "pipewire|wireplumber|pipewire-pulse" >/dev/null; do sleep 0.1; done
        pipewire &
        sleep 0.5
        wireplumber &
        pipewire-pulse &
        disown -a
        '
    ]])
end

return M
