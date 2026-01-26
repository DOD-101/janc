---@type Lang
return {
	names = { "svelte" },
	formatters = {},
	lsps = {
		{
			name = "svelte",
			settings = {},
		},
		{
			name = "denols",
			settings = {},
			root_dir = function(bufnr, on_dir)
				-- vim.notify("penix" .. "denols")
				-- The project root is where the LSP can be started from
				local root_markers = { "deno.lock" }
				-- Give the root markers equal priority by wrapping them in a table
				root_markers = vim.fn.has("nvim-0.11.3") == 1 and { root_markers, { ".git" } }
					or vim.list_extend(root_markers, { ".git" })
				-- exclude non-deno projects (npm, yarn, pnpm, bun)
				local non_deno_path =
					vim.fs.root(bufnr, { "package-lock.json", "yarn.lock", "pnpm-lock.yaml", "bun.lockb", "bun.lock" })
				local project_root = vim.fs.root(bufnr, root_markers)
				-- vim.notify("penix " .. "denols" .. "ended: " .. project_root)
				if non_deno_path and (not project_root or #non_deno_path >= #project_root) then
					return
				end
				-- We fallback to the current working directory if no project root is found
				on_dir(project_root or vim.fn.getcwd())
			end,
		},
		{
			name = "tailwindcss",
			settings = {},
		},
	},
	patterns = { "*.svelte" },
}
