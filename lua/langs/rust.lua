---@type Lang
local lang = {
	names = { "rust" },
	formatters = { "rustfmt" },
	lsps = { "rust_analyzer" },
	patterns = { "*.rs" },
}

require("conform").formatters.rustfmt = {
	command = "cargo fmt",
}

return lang
