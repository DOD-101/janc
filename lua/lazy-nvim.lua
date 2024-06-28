local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {}

local function merge(plugin)
    -- Iterate over each element in the table
    for _, value in ipairs(plugin) do
        -- Add each element from the table to M
        table.insert(plugins, value)
    end
end

merge(require("plugins"))

table.insert(plugins, { dir = "/home/david/.config/nvim/nvim-testing/lua/themes/ocean_breeze", lazy = true })
require("lazy").setup(plugins, opts)
