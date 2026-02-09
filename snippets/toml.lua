---@diagnostic disable undefined-global
-- luacheck: ignore 113
return {
	s("workspace", {
		t("workspace = "),
		i(1, "true"),
	}, {
		show_condition = function()
			return vim.fn.expand("%:t") == "Cargo.toml"
		end,
	}),
}
