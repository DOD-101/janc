---@diagnostic disable undefined-global
-- luacheck: ignore 113
return {
	s({ trig = "interface", description = "Create a zbus interface" }, {
		t({ "#[interface(", '    name = "' }),
		i(1, "dbus.interface.name"),
		t({ '",', "    proxy(", "        gen_blocking = " }),
		i(2, "false"),
		t({ ",", '        default_path = "' }),
		i(3, "/default/dbus/path"),
		t({ '",', "        default_service = " }),
		i(4, '"default.dbus.service"'),
		t({ "", "   )", ")]", "impl " }),
		i(5, "InterfaceStruct"),
		t(" {"),
		i(6),
		t("}"),
	}),
}
