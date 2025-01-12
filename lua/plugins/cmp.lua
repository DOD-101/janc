local plugin = {
	{
		"hrsh7th/nvim-cmp",
		lazy = true,
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"f3fora/cmp-spell",
			"onsails/lspkind.nvim",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lua",
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
		},
		config = function()
			local cmp = require("cmp")

			-- Search Autocomplete
			cmp.setup.cmdline("/", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})

			cmp.setup.cmdline(":", {
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{ name = "cmdline" },
				}),
			})

			local lspkind = require("lspkind")
			cmp.setup({
				enabled = function()
					return true
				end,

				preselect = cmp.PreselectMode.None,

				mapping = {
					["<Tab>"] = cmp.mapping.select_next_item(),
					["<S-Tab>"] = cmp.mapping.select_prev_item(),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-Enter>"] = cmp.mapping.confirm({ select = true }),
				},

				formatting = {
					format = lspkind.cmp_format({
						mode = "symbol",
						menu = {},
						symbol_map = {
							Text = "󰉿",
							Method = "󰆧",
							Function = "󰊕",
							Constructor = "",
							Field = "󰜢",
							Variable = "󰀫",
							Class = "󰠱",
							Interface = "",
							Module = "",
							Property = "󰜢",
							Unit = "󰑭",
							Value = "󰎠",
							Enum = "",
							Keyword = "󰌋",
							Snippet = "",
							Color = "󰏘",
							File = "󰈙",
							Reference = "󰈇",
							Folder = "󰉋",
							EnumMember = "",
							Constant = "󰏿",
							Struct = "󰙅",
							Event = "",
							Operator = "󰆕",
							TypeParameter = "",
							Supermaven = "",
						},
					}),
				},
				sorting = {
					priority_weight = 1,
					comparators = {
						cmp.config.compare.offset,
						cmp.config.compare.scopes,
						cmp.config.compare.exact,
						cmp.config.compare.score,
						cmp.config.compare.recently_used,
						cmp.config.compare.locality,
						cmp.config.compare.kind,
						cmp.config.compare.sort_text,
						cmp.config.compare.length,
						cmp.config.compare.order,
					},
				},

				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},

				sources = cmp.config.sources({
					{
						name = "spell",
						option = {
							keep_all_entries = false,
							enable_in_context = function()
								-- disable completion in comments
								local context = require("cmp.config.context")
								-- keep command mode completion enabled when cursor is in a comment
								if vim.api.nvim_get_mode().mode == "c" then
									return true
								else
									-- check if the current file is a Markdown file
									local bufname = vim.api.nvim_buf_get_name(0)
									if bufname:match("%.md$") then
										return true
									else
										return context.in_treesitter_capture("comment")
											or context.in_syntax_group("Comment")
									end
								end
							end,
						},
					},
					{ name = "nvim_lsp", priority = 30 },
					{ name = "luasnip", priority = 20 },
					{ name = "supermaven", priority = 10 },
					{ name = "nvim_lsp_signature_help", priority = 10 },
					{ name = "path" },
					{ name = "buffer", keyword_length = 3 },
					{ name = "nvim_lua" },
				}),
			})
		end,
	},
}

return plugin
