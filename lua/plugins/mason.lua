local plugin = {
    "williamboman/mason.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
        },
        -- Mason and other language features are configured in langs/
}

return plugin
