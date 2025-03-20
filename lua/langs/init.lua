---@class Lang A class representing all the config data for a language or a group of languages
---@field names string[] The name of the languages
---@field formatters table A table of formatters to run on the buffer after saving
---@field treesitter string? Optional name of the treesitter for the language, defaults to the name
---@field linters table? An optional table of linters to run on the buffer
---@field lsps lspConf[] Config relating to the LSP for the language
---@field patterns string[] A table of patterns for file extensions for the lang
---@field noSetup boolean? Weather to do the default setup for the lang
---@field tabsize number? The tabsize in. `nil` will leave this as the default.

---@class lspConf A class representing all the config for an LSP
---@field name string The name of the LSP
---@field settings table The settings table used in the setup function
---@field callback function? A callback to override the default setup function

local langs = {
	require("langs.lua"),
	require("langs.html"),
	require("langs.css"),
	require("langs.js"),
	require("langs.svelte"),
	require("langs.json"),
	require("langs.python"),
	require("langs.sh"),
	require("langs.rust"),
	require("langs.nix"),
	require("langs.hypr"),
	require("langs.markdown"),
	require("langs.yaml"),
	require("langs.toml"),
	require("langs.yuck"),
	require("langs.java"),
}

local formatters = {}
local treesitters = {}

for _, lang in ipairs(langs) do
	for _, name in ipairs(lang.names) do
		formatters[name] = lang.formatters
	end

	table.insert(treesitters, lang.treesitter)

	if lang.tabsize then
		vim.api.nvim_create_autocmd({ "BufEnter", "BufRead", "BufNewFile" }, {
			pattern = lang.patterns,
			callback = function()
				vim.cmd("setlocal tabstop=" .. lang.tabsize)
			end,
		})
	end

	if lang.noSetup then
		goto continue
	end

	local lspconfig = require("lspconfig")

	for _, lsp in ipairs(lang.lsps) do
		lspconfig[lsp.name].setup({
			settings = lsp.settings,
			filetypes = require("lspconfig.configs")[lsp.name].filetypes,
		})
	end

	if lang.linters then
		--- TODO: We could try being more agressive with the linting here
		vim.api.nvim_create_autocmd({ "BufEnter", "BufRead", "BufWritePost" }, {
			pattern = lang.patterns,
			once = false,
			callback = function()
				require("lint").try_lint(lang.linters)
			end,
		})
	end

	::continue::
end

require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

require("mason-lspconfig").setup({ ensure_installed = {}, automatic_installation = false })

require("conform").setup({
	formatters_by_ft = formatters,
	log_level = vim.log.levels.INFO,
	async = true,
	notify_on_error = false,
	format_on_save = {
		timeout_ms = 1000,
		lsp_fallback = true,
	},
})

require("nvim-treesitter.configs").setup({
	ensure_install = treesitters,
	auto_install = true,
	highlight = { enable = true },
	indent = { enable = true },
})

--- Print out all tools (LSP, formatters & linters) for all languages
vim.api.nvim_create_user_command("ListLangTools", function()
	local output = ""
	for _, lang in ipairs(langs) do
		output = output .. "--" .. table.concat(lang.names, ", ") .. "--" .. "\nLSPs:"
		for _, lsp in ipairs(lang.lsps) do
			output = output .. " " .. lsp.name
		end

		output = output .. "\nFormatters:"
		for _, formatter in ipairs(lang.formatters) do
			output = output .. " " .. formatter
		end

		output = output .. "\nLinters:"
		for _, linter in ipairs(lang.linters or {}) do
			output = output .. " " .. linter
		end

		output = output .. "\n\n"
	end

	print(output)
end, {})
