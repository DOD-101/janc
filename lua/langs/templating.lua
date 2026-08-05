--- lang definitions for all types of different templating languages
--- this is a single module since most of them are very similar to each other

---@type Lang
local jinja = {
	name = "jinja",
	lsps = {},
	formatters = {},
	tabsize = 2,
	patterns = { "*.askama" },
}

---@type Lang
local htmldjango = {
	name = "htmldjango",
	lsps = {},
	formatters = { "prettier" },
	tabsize = 2,
	patterns = {}, -- there is not file type for django templates, annoying
}

-- non-standard templating langs that are very close to other and don't have their own tooling
-- these file type associations are primarily for treesitter
vim.filetype.add({
	extension = {
		njk = "htmldjango",
		askama = "jinja",
	},
})

---@type Lang
local njk = vim.tbl_deep_extend("force", htmldjango, {
	name = "njk",
	treesitter = "htmldjango",
	patterns = { "*.njk" },
})

---@type Lang
local askama = vim.tbl_deep_extend("force", jinja, {
	name = "askama",
	treesitter = "jinja",
	patterns = { "*.askama" },
})

return { jinja, htmldjango, njk, askama }
