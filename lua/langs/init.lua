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
---@field filetypes string[]? The filetypes for the LSP
---@field root_dir function? Override function used to determine root dir
---@field callback function? A callback to override the default setup function

local langs = {
	require("langs.askama"),
	require("langs.css"),
	require("langs.html"),
	require("langs.hypr"),
	require("langs.java"),
	require("langs.js"),
	require("langs.json"),
	require("langs.lua"),
	require("langs.markdown"),
	require("langs.nix"),
	require("langs.python"),
	require("langs.rust"),
	require("langs.sh"),
	require("langs.svelte"),
	require("langs.toml"),
	require("langs.yaml"),
	require("langs.yuck"),
}

local formatters = {}
local treesitters = { "gitcommit" }

for _, lang in ipairs(langs) do
	for _, name in ipairs(lang.names) do
		formatters[name] = lang.formatters
	end

	if lang.treesitter then
		table.insert(treesitters, lang.treesitter)
	else
		vim.list_extend(
			treesitters,
			vim.tbl_filter(function(value)
				return vim.list_contains(require("nvim-treesitter").get_available(), value)
			end, lang.names)
		)
	end

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

	for _, lsp in ipairs(lang.lsps) do
		vim.lsp.config(lsp.name, {
			settings = lsp.settings,
			filetypes = lsp.filetypes or require("lspconfig.configs." .. lsp.name).default_config.filetypes,
			root_dir = lsp.root_dir,
		})
		vim.lsp.enable(lsp.name)
	end

	if lang.linters then
		--- NOTE: We could try being more agressive with the linting here
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

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = treesitters,
	once = false,
	callback = function()
		vim.treesitter.start()
	end,
})

require("nvim-treesitter").install(treesitters)

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
