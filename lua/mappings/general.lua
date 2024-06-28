vim.keymap.set("n", "<leader>w", function()
	vim.cmd("cd %:p:h")
end, { desc = "Change directory to current file's parent" })

vim.keymap.set("n", "<leader>c", function()
	vim.cmd("Colortils picker")
end, { desc = "Color picker" })

vim.keymap.set("n", "<leader>h", function()
	vim.cmd("noh")
end, {})

-- tabs

vim.keymap.set("n", "<leader>t", ":tabnew<CR>", { noremap = true, silent = true, desc = "New tab" })
vim.keymap.set("n", "<C-l>", ":tabnext<CR>", { noremap = true, silent = true, desc = "Tab next" })
vim.keymap.set("n", "<C-h>", ":tabprevious<CR>", { noremap = true, silent = true, desc = "Tab previous" })

-- insert lines
vim.api.nvim_set_keymap("n", "<C-j>", [[:<C-u>call append(line("."), repeat([""], v:count1))<CR>]], { silent = true })

vim.api.nvim_set_keymap(
	"n",
	"<C-k>",
	[[:<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>]],
	{ noremap = true, silent = true }
)
