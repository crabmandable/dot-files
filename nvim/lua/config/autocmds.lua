-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_autocmd({ "BufWinEnter", "VimEnter", "WinEnter" }, {
    pattern = { "*COMMIT_EDITMSG" },
    command = "setlocal nolist",
})

vim.api.nvim_create_autocmd({ "BufWinEnter", "VimEnter", "WinEnter", "WinLeave" }, {
    callback = function(ev)
        if ev.event == "WinLeave" then
            vim.cmd.setlocal("nocursorline")
        else
            vim.cmd.setlocal("cursorline")
        end
    end,
})

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    callback = function()
        local save = vim.fn.winsaveview()
        -- Remove trailing whitespace
        vim.cmd([[%s/\s\+$//e]])
        -- Move cursor to the original position
        vim.fn.winrestview(save)
    end,
})
