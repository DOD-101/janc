---@type vim.lsp.Config
return {
	settings = {
		schemas = require("schemastore").json.schemas(),
		validate = { enable = true },
	},
}
