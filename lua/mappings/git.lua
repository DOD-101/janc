local builtin = require("telescope.builtin")

local git_leader = "<leader><leader>"

vim.keymap.set("n", git_leader .. "g", "<cmd>Neogit<CR>", { noremap = true, silent = true })

vim.keymap.set("n", git_leader .. "c", builtin.git_commits, {})
vim.keymap.set("n", git_leader .. "b", builtin.git_branches, {})
vim.keymap.set("n", git_leader .. "s", builtin.git_stash, {})

vim.keymap.set("n", git_leader .. "n", ":Gitsigns nav_hunk next<CR>")
vim.keymap.set("n", git_leader .. "p", ":Gitsigns nav_hunk prev<CR>")
vim.keymap.set("n", git_leader .. "d", ":Gitsigns preview_hunk<CR>")
vim.keymap.set("n", git_leader .. "u", ":Gitsigns reset_hunk<CR>")

vim.keymap.set("n", git_leader .. "w", function()
	local handle = io.popen("git rev-parse --show-toplevel 2> /dev/null")

	if not handle then
		vim.cmd("echo 'Failed to get git root dir.'")
		return
	end

	local root_dir = handle:read("*l")
	handle:close()
	if not root_dir then
		vim.cmd("echo 'Failed to get git root dir.'")
		return
	end

	vim.cmd("cd " .. root_dir)
end)
