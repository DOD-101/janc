local builtin = require("telescope.builtin")

local git_leader = "<leader><leader>"

vim.keymap.set("n", git_leader .. "g", "<cmd>Neogit<CR>", { noremap = true, silent = true })

vim.keymap.set("n", git_leader .. "c", builtin.git_commits, {})
vim.keymap.set("n", git_leader .. "b", builtin.git_branches, {})
vim.keymap.set("n", git_leader .. "s", builtin.git_stash, {})

vim.keymap.set("n", git_leader .. "n", ":GitGutterNextHunk<CR>")
vim.keymap.set("n", git_leader .. "p", ":GitGutterPrevHunk<CR>")
vim.keymap.set("n", git_leader .. "d", ":GitGutterPreviewHunk<CR>")
vim.keymap.set("n", git_leader .. "u", ":GitGutterUndoHunk<CR>")

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
