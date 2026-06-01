---@diagnostic disable: undefined-global

-- ==========================================
--                 Layouts
-- ==========================================
hl.config({
	dwindle = {
		preserve_split = true,
	},
})

-- For Noctalia shell to show persistent workspace
for i = 1, 5 do
	hl.workspace_rule({
		workspace = tostring(i),
		persistent = true,
	})
end
