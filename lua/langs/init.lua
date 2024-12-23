---@class Lang A class representing all the config data for a language
---@field lang string The name of the language
---@field filetype string The vim file type
---@field formatter table A table of formatters to run on the buffer after saving
---@field treesitter string The name of the treesitter for the language
---@field linters table | nil An optional table of linters to run on the buffer
---@field lsp lspConf Config relating to the LSP for the language
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
	formatters[lang.lang] = lang.formatter
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

	vim.api.nvim_create_autocmd({ "BufEnter", "BufRead", "BufNewFile" }, {
		pattern = lang.pattern,
		once = true,
		callback = function()
			require("langs.install").ensure_installed(lang.lsp.name, lang.lsp.callback or function()
				local lspconfig = require("lspconfig")

				lspconfig[lang.lsp.name].setup({
					capabilities = require("cmp_nvim_lsp").default_capabilities(),
					settings = lang.lsp.settings,
					filetypes = { lang.filetype },
				})
			end)
		end,
	})

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
