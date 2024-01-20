-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- stop highliting search
vim.keymap.set("n", "<Leader>v", "<cmd>noh<cr>")

--  splitting
vim.keymap.set("n", "<leader>ah", "<cmd>vsplit<cr><C-W>h")
vim.keymap.set("n", "<leader>al", "<cmd>vsplit<cr>")
vim.keymap.set("n", "<leader>ak", "<cmd>split<cr><C-W>k")
vim.keymap.set("n", "<leader>aj", "<cmd>split<cr>")

vim.keymap.set("n", "<Leader>v", "<cmd>noh<cr>")
