local ls = require("luasnip")

vim.keymap.set({ "i", "s" }, "<C-n>", function()
	ls.jump(1)
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-p>", function()
	ls.jump(-1)
end, { silent = true })
