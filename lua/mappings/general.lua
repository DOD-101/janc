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

-- Define mappings for navigating panes
vim.keymap.set("n", "<A-k>", "<C-w>k", { noremap = true, silent = true }) -- Up
vim.keymap.set("n", "<A-j>", "<C-w>j", { noremap = true, silent = true }) -- Down
vim.keymap.set("n", "<A-h>", "<C-w>h", { noremap = true, silent = true }) -- Left
vim.keymap.set("n", "<A-l>", "<C-w>l", { noremap = true, silent = true }) -- Right
