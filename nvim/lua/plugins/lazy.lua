-- This is where I put config for the base LazyVim plugins
return {
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "tokyonight",
        },
    },
    {
        "akinsho/bufferline.nvim",
        keys = {
            { "<S-l>",  false },
            { "<S-h",  false },
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
        enabled = false,
        keys = {
            { "s", mode = { "n", "e", "o" }, false },
        },
    },
    {
        "folke/tokyonight.nvim",
        opts = {
            transparent = true,
            styles = {
                sidebars = "transparent",
                floats = "transparent",
            },
        },
    },
}
