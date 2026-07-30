---@diagnostic disable: undefined-global

-- ==========================================
--                 Layouts
-- ==========================================

-- For Noctalia shell to show persistent workspace
for i = 1, 5 do
	hl.workspace_rule({
		workspace = tostring(i),
		persistent = true,
	})
end
