---@diagnostic disable: undefined-global

-- ==========================================
--              WINDOW RULES
-- ==========================================

-- no VSync for fullscreen app
hl.window_rule({
  match = { fullscreen = true },
  immediate = true
})

-- no fullscreen, please
hl.window_rule({
    name = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})
