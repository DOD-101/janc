---@type vim.lsp.Config
return {
	settings = {
		schemas = require("schemastore").yaml.schemas(),
		validate = { enable = true },
	},
}
