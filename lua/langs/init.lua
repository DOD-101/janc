---@class Lang A class representing all the config data for a language
---@field name string The name of the language
---@field formatters table Formatters to run on the buffer after saving
---@field treesitter string? Name of the treesitter for the language, defaults to the name
---@field linters table? Linters to run on the buffer
---@field lsps string[] Names of lsps for this lang
---@field patterns string[] A table of patterns for file extensions for the lang
---@field tabsize number? The tabsize in. `nil` will leave this as the default.

---@type Lang[] | Lang[][]
local langs = {
	require("langs.askama"),
	require("langs.css"),
	require("langs.dart"),
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
}

local flattened_res = vim.fn.flatten(langs)

if type(flattened_res) == "number" then
	vim.print("Failed to setup languages. Flattening langs failed.")
	return
end

---@type Lang[]
local flat_langs = flattened_res

local formatters = {}
local treesitters = { "gitcommit" }

for _, lang in ipairs(flat_langs) do
	formatters[lang.name] = lang.formatters

	if lang.treesitter then
		table.insert(treesitters, lang.treesitter)
	elseif vim.list_contains(require("nvim-treesitter").get_available(), lang.name) then
		table.insert(treesitters, lang.name)
	end

	if lang.tabsize then
		vim.api.nvim_create_autocmd({ "BufEnter", "BufRead", "BufNewFile" }, {
			pattern = lang.patterns,
			callback = function()
				vim.cmd("setlocal tabstop=" .. lang.tabsize)
			end,
		})
	end

	for _, lsp in ipairs(lang.lsps) do
		vim.lsp.enable(lsp)
	end

	if lang.linters then
		--- NOTE: We could try being more aggressive with the linting here
		vim.api.nvim_create_autocmd({ "BufEnter", "BufRead", "BufWritePost" }, {
			pattern = lang.patterns,
			once = false,
			callback = function()
				require("lint").try_lint(lang.linters)
			end,
		})
	end
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
	callback = function()
		vim.treesitter.start()
	end,
})

require("nvim-treesitter").install(treesitters)

--- Print out all tools (LSP, formatters & linters) for all languages
vim.api.nvim_create_user_command("ListLangTools", function()
	local output = ""
	for _, lang in ipairs(flat_langs) do
		output = output .. "--" .. lang.name .. "--" .. "\nLSPs:"
		for _, lsp in ipairs(lang.lsps) do
			output = output .. " " .. lsp
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
