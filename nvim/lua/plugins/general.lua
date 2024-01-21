return {
    {
        "kelly-lin/ranger.nvim",
        config = function()
            local ranger_nvim = require("ranger-nvim")
            ranger_nvim.setup({
                enable_cmds = false,
                replace_netrw = true,
                keybinds = {
                    ["ov"] = ranger_nvim.OPEN_MODE.vsplit,
                    ["oh"] = ranger_nvim.OPEN_MODE.split,
                    ["ot"] = ranger_nvim.OPEN_MODE.tabedit,
                    ["or"] = ranger_nvim.OPEN_MODE.rifle,
                },
                ui = {
                    border = "none",
                    height = 1,
                    width = 1,
                    x = 0.5,
                    y = 0.5,
                },
            })
            vim.api.nvim_set_keymap("n", "<Leader>af", "", {
                noremap = true,
                callback = function()
                    require("ranger-nvim").open(true)
                end,
            })
        end,
    },
    { --  replacement for a.vim
        "jakemason/ouroboros.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    { "numkil/ag.nvim" },
    { "tpope/vim-fugitive" },
    { "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 },
}
