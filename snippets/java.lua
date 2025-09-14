---@diagnostic disable undefined-global
-- luacheck: ignore 113
return {
	s("print", {
		t("System.out.print("),
		i(1),
		t(");"),
		i(2),
	}),
	s("println", {
		t("System.out.println("),
		i(1),
		t(");"),
		i(2),
	}),
}
