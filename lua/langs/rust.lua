local cargo_features_env = os.getenv("JANC_CARGO_FEATURES")
local cargo_features = {}

if cargo_features_env ~= nil and cargo_features_env ~= "" then
	local function split(str, sep)
		local result = {}
		local regex = ("([^%s]+)"):format(sep)
		for each in str:gmatch(regex) do
			table.insert(result, each)
		end
		return result
	end
	cargo_features = split(cargo_features_env, ",")
end

---@type Lang
local lang = {
	names = { "rust" },
	formatters = { "rustfmt" },
	lsps = {
		{
			name = "rust_analyzer",
			settings = {
				cargo = {
					buildScripts = {
						enable = true,
					},
				},
				procMacro = {
					enable = true,
				},
				["rust-analyzer"] = {
					checkOnSave = true,
					allFeatures = true,
					preferSelf = true,
					inlayHints = {
						implicitDrops = {
							enable = true,
						},
					},
					cargo = {
						features = cargo_features or "all",
					},

					check = {
						command = "clippy",
					},
				},
			},
		},
	},
	patterns = { "*.rs" },
}

require("conform").formatters.rustfmt = {
	command = "cargo fmt",
}

return lang
