local langs = {
	require("langs.lua"),
	require("langs.html"),
	require("langs.css"),
	require("langs.js"),
	require("langs.json"),
	require("langs.python"),
	require("langs.sh"),
	require("langs.rust"),
}

local formatters = {}
local treesitter = {}

for _, lang in ipairs(langs) do
	formatters[lang.lang] = lang.formatter
	table.insert(treesitter, lang.treesitter)
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

require("mason-lspconfig").setup({ automatic_installation = true })

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
