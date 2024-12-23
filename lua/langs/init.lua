---@class Lang A class representing all the config data for a language
---@field lang string The name of the language
---@field formatters table A table of formatters to run on the buffer after saving
---@field treesitter string The name of the treesitter for the language
---@field linters table | nil An optional table of linters to run on the buffer
---@field lsps lspConf[] Config relating to the LSP for the language
---@field pattern table A table of patterns for file extensions for the lang
---@field noSetup boolean | nil Weather to do the default setup for the lang
---@field tabsize number | nil The tabsize in. `nil` will leave this as the default.

---@class lspConf A class representing all the config for an LSP
---@field name string The name of the LSP
---@field settings table The settings table used in the setup function
---@field callback function | nil A callback to override the default setup function

local langs = {
	require("langs.lua"),
	require("langs.html"),
	require("langs.css"),
	require("langs.js"),
	require("langs.json"),
	require("langs.python"),
	require("langs.sh"),
	require("langs.rust"),
	require("langs.nix"),
	require("langs.hypr"),
}

local formatters = {}
local treesitter = {}

for _, lang in ipairs(langs) do
	formatters[lang.lang] = lang.formatters
	table.insert(treesitter, lang.treesitter)

	if lang.tabsize then
		vim.api.nvim_create_autocmd({ "BufEnter", "BufRead", "BufNewFile" }, {
			pattern = lang.pattern,
			callback = function()
				vim.cmd("setlocal tabstop=" .. lang.tabsize)
			end,
		})
	end

	if lang.noSetup then
		goto continue
	end

	-- NOTE: We need this since one lang can have more than 1 LSP
	for _, lsp in ipairs(lang.lsps) do
		vim.api.nvim_create_autocmd({ "BufEnter", "BufRead", "BufNewFile" }, {
			pattern = lang.pattern,
			once = true,
			callback = function()
				local lspconfig = require("lspconfig")

				lspconfig[lsp.name].setup({
					capabilities = require("cmp_nvim_lsp").default_capabilities(),
					settings = lsp.settings,
					filetypes = { lang.lang },
				})
			end,
		})
	end

	if lang.linters then
		--- TODO: We could try being more agressive with the linting here
		vim.api.nvim_create_autocmd({ "BufWritePost" }, {
			pattern = lang.pattern,
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

require("mason-lspconfig").setup({ automatic_installation = false })

require("conform").setup({
	formatters_by_ft = formatters,
	log_level = vim.log.levels.INFO,
	async = true,
	notify_on_error = false,
	format_on_save = {
		timeout_ms = 1000,
		lsp_fallback = false,
	},
})

require("nvim-treesitter.configs").setup({
	ensure_install = treesitter,
	auto_install = true,
	highlight = { enable = true },
	indent = { enable = true },
})

--- Print out all tools (LSP, formatters & linters) for all languages
vim.api.nvim_create_user_command("ListLangTools", function()
	local output = ""
	for _, lang in ipairs(langs) do
		output = output .. "--" .. lang.lang .. "--" .. "\nLSPs:"
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
