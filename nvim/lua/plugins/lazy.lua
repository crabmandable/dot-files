-- This is where I put config for the base LazyVim plugins
return {
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "catppuccin",
        },
    },
    { "echasnovski/mini.pairs", enabled = false },
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "clangd",
                "cmakelang",
                "codespell",
                "shfmt",
                "stylua",
            },
        },
    },
    {
        "folke/flash.nvim",
        keys = {
            { "s", mode = { "n", "e", "o" }, false },
        },
    },
}
