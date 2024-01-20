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

-- close location & quick fix and stop highlighting search
vim.keymap.set("n", "<Leader>v", "<cmd>pc<cr><cmd>lcl<cr><cmd>ccl<cr><cmd>noh<cr>")

vim.keymap.set("n", "<Leader>aa", "<cmd>Ouroboros<cr>")

vim.keymap.set("n", "<Leader>fw", [["zyiw:exe "Ag ".@z.""<cr><cr><cr>]])
vim.keymap.set("n", "<Leader>f<space>", ":Ag ")

-- sub the word under the cursor
vim.keymap.set("n", "<Leader>ar", [[:%s/\<<C-r><C-w>\>/]])
