---Sets `vim.o.shell`
---@return nil
local function set_shell()
	local shell = os.getenv("SHELL")

	if shell == nil then
		return
	end

	if string.match(shell, "zsh") then
		shell = shell .. " -i"
	end

	vim.o.shell = shell
end

print("Hello")

vim.o.number = true
vim.o.relativenumber = true
vim.o.termguicolors = true

vim.o.tabstop = 4
vim.o.shiftwidth = 0
vim.o.expandtab = true

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.g.netrw_banner = 0

vim.o.undofile = true

vim.opt.spell = true
vim.opt.spelllang = { "en_us", "de_de", "es" }

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.splitbelow = true
vim.g.netrw_browse_split = 2

set_shell()

require("lazy-nvim")
require("langs")
require("diagnostic")
require("mappings")

vim.cmd([[ colorscheme ]] .. (vim.env.JANC_NVIM_COLORSCHEME or "tokyonight"))
