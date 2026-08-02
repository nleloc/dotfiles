---@diagnostic disable: undefined-global

-- ==========================================
--               Misc script
-- ==========================================

local M = {}

-- restart QuickShell ( Noctalia )
function M.rs_quickshell()
	return hl.dsp.exec_cmd([[
        bash -c '
        killall -q qs quickshell wlsunset
        while pgrep -u $USER -x "qs|quickshell|wlsunset" >/dev/null; do sleep 0.2; done
        qs -c noctalia-shell &
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
