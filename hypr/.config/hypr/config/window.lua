---@diagnostic disable: undefined-global

-- ==========================================
--              WINDOW RULES
-- ==========================================

-- no VSync for fullscreen app
hl.window_rule({
  match = { fullscreen = true },
  immediate = true
})
