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

---@type vim.lsp.Config
return {
	settings = {
		["rust-analyzer"] = {
			cargo = {
				buildScripts = { enable = true },
				features = #cargo_features > 0 and cargo_features or "all",
			},
			procMacro = { enable = true },
			checkOnSave = true,
			preferSelf = true,
			check = {
				command = "clippy",
				allTargets = true,
			},
			diagnostics = {
				enable = true,
				style = { enable = true },
			},
			highlightRelated = {
				highlights = { enable = true },
			},
			assist = {
				expressionFillDefault = "todo",
			},
			completion = {
				autoimport = { enable = true },
			},
			caching = { enable = true },
			inlayHints = {
				implicitDrops = { enable = true },
				lifetimeElisionHints = { enable = "always" },
				parameterHints = { enable = true },
				closureReturnTypeHints = { enable = "with_block" },
			},
		},
	},
}
