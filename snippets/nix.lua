---@diagnostic disable undefined-global
-- luacheck: ignore 113
return {
	s("fakeHash", t('"${lib.fakeHash}"')),
	s({ trig = "mkOption", desc = "Create a new nix option." }, {
		t("lib.mkOption {"),
		t("type = lib.types."),
		i(1),
		t(";"),
		t("default = "),
		i(2),
		t(";"),
		t('description = "'),
		i(3),
		t('"'),
		t(";"),
		t("}"),
		i(4),
	}),
}
