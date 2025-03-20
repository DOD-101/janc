return {
	"saghen/blink.cmp",
	lazy = true,
	event = "InsertEnter",
	dependencies = {
		"joshzcold/blink-ripgrep.nvim",
		{
			"folke/lazydev.nvim",
			ft = "lua", -- only load on lua files
			opts = {
				library = {
					-- See the configuration section for more details
					-- Load luvit types when the `vim.uv` word is found
					{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				},
			},
		},
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*",
			-- install jsregexp (optional!)
			build = "make install_jsregexp",
			config = function()
				require("luasnip.loaders.from_vscode").lazy_load()
				require("luasnip.loaders.from_lua").load({ paths = "./snippets/" })
			end,
			dependencies = {
				"rafamadriz/friendly-snippets",
			},
		},
		"rafamadriz/friendly-snippets",
	},

	-- use a release tag to download pre-built binaries
	version = "*",
	-- build = 'cargo build --release',
	build = "nix run .#build-plugin",

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		-- 'default' for mappings similar to built-in completion
		-- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
		-- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
		-- See the full "keymap" documentation for information on defining your own keymap.
		keymap = {
			preset = "none",
			["<Tab>"] = { "select_next", "fallback" },
			["<S-Tab>"] = { "select_prev", "fallback" },
			["<C-Space>"] = { "show" },
			["<C-Enter>"] = { "accept" },
		},

		appearance = {
			-- Sets the fallback highlight groups to nvim-cmp's highlight groups
			-- Useful for when your theme doesn't support blink.cmp
			-- Will be removed in a future release
			use_nvim_cmp_as_default = true,
			-- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
			-- Adjusts spacing to ensure icons are aligned
			nerd_font_variant = "mono",
		},

		completion = {
			documentation = { auto_show = true, auto_show_delay_ms = 0 },
		},

		-- Default list of enabled providers defined so that you can extend it
		-- elsewhere in your config, without redefining it, due to `opts_extend`
		sources = {
			providers = {
				lsp = {
					name = "LSP",
					module = "blink.cmp.sources.lsp",
					score_offset = 110,
				},
				snippets = {
					name = "Snippets",
					module = "blink.cmp.sources.snippets",
					async = true,
					score_offset = 100,
				},
				ripgrep = {
					module = "blink-ripgrep",
					name = "Ripgrep",
					timeout_ms = 200,
					---@module 'blink-ripgrep'
					---@type blink-ripgrep.Options
					opts = {
						prefix_min_len = 3,
						context_size = 10,
						max_filesize = "500k",
						search_casing = "--smart-case",
					},
				},
				path = {
					name = "Path",
					module = "blink.cmp.sources.path",
					score_offset = 1000,
				},
			},
			default = { "lsp", "path", "snippets", "buffer", "ripgrep" },
		},

		snippets = { preset = "luasnip" },

		signature = { enabled = true },
	},
	opts_extend = { "sources.default" },
}
