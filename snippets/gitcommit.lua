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
}
