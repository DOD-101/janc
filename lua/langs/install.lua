M = {}
local timeout = 1e5

local function is_server_installed(server_name)
	local mason_lsp = require("mason-lspconfig")

	for _, v in ipairs(mason_lsp.get_installed_servers()) do
		if v == server_name then
			return true
		end
	end
	return false
end

function M.ensure_installed(server_name, callback)
	if is_server_installed(server_name) then
		callback()
		return true
	end

	-- BufferNr before Mason starts -- Why?
	local bufnr = vim.api.nvim_get_current_buf()

	vim.cmd("LspInstall " .. server_name)

	-- Polling function to check if server is installed
	local iterations = math.ceil(timeout / 500)

	local function poll_server_install()
		if iterations <= 0 then -- Stop polling after timeout
			print("Timeout exceeded. Server installation failed.")
			return
		end

		if is_server_installed() then
			print("Server installation success")
			callback()
			-- Leave the Mason buffer
			vim.api.nvim_command("buffer " .. bufnr)
			-- And manually start the lsp (because it was not installed at autostart)
			vim.api.nvim_command("LspStart " .. server_name)
			print("Server successfully started")
			return
		else
			iterations = iterations - 1
			vim.defer_fn(poll_server_install, 500) -- Check again in 500ms
		end
	end

	-- Start polling
	vim.defer_fn(poll_server_install, 500)

	return false
end

return M
