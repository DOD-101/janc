---@diagnostic disable undefined-global
-- luacheck: ignore 113
return {
	s(
		"wip",
		sn(1, {
			t("WIP: "),
			i(1),
			t({
				"",
				"",
				"This commit will be *force-push*ed over.",
				"This is a something which is still in the works and not yet ready for a proper commit.",
				"",
				"If you are seeing this in the history of a branch I probably forgot to remove it. ",
				"Oops.",
				"",
			}),
		})
	),
	s("deps", {
		t("feat(deps): update lazy-lock.json"),
	}, {
		show_condition = function()
			-- only show if lazy-lock.json has been modified
			local result = vim.system({
				"git",
				"status",
				"--porcelain",
				"--",
				"lazy-lock.json",
			}, { text = true }):wait()

			-- Not a git repo or git failed.
			if result.code ~= 0 then
				return false
			end

			return result.stdout ~= ""
		end,
	}),
}
