-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

--  fucking stop lazy vim from mapping these :/
vim.cmd.nunmap("<S-l>")
vim.cmd.nunmap("<S-h>")

--  splitting
vim.keymap.set("n", "<leader>ah", "<cmd>vsplit<cr><C-W>h")
vim.keymap.set("n", "<leader>al", "<cmd>vsplit<cr>")
vim.keymap.set("n", "<leader>ak", "<cmd>split<cr><C-W>k")
vim.keymap.set("n", "<leader>aj", "<cmd>split<cr>")

-- close location & quick fix and stop highlighting search
vim.keymap.set("n", "<Leader>v", "<cmd>pc<cr><cmd>lcl<cr><cmd>ccl<cr><cmd>noh<cr>", { desc = "Clear search" })

vim.keymap.set("n", "<Leader>fw", [["zyiw:exe "Ag ".@z.""<cr><cr><cr>]], { desc = "Ag word" })
vim.keymap.set("n", "<Leader>f<space>", "<cmd>Ag ", { desc = "Ag" })

vim.keymap.set("n", "<Leader>ar", [[:%s/\<<C-r><C-w>\>/]], { desc = "Sub word under cursor" })
vim.keymap.set("n", "<Leader>D", [[<cmd>CopyLn <cr>]], { silent = true, desc = "Copy line to clipboard" })

vim.keymap.set("n", "<Leader>ad", function()
    if vim.diagnostic.is_disabled(0) then
        vim.diagnostic.enable(0)
    else
        vim.diagnostic.disable(0)
    end
end, { silent = true, desc = "Toggle diagnostics for current buffer" })

vim.keymap.set("n", "<leader>cg", "<cmd>Neogen<cr>", { silent = true, desc = "Neogen" })

vim.keymap.set("n", "<leader>p", "\"0p", { desc = "[p]ut from 0"})
vim.keymap.set("n", "<leader>P", "\"0P", { desc = "[P]ut from 0"})
