-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- vim.api.nvim_create_user_command("Rg", "lua vim.cmd('silent grep! test | copen')", {})

vim.api.nvim_create_user_command("CopyLn", function()
    vim.fn.setreg("+", vim.fn.expand("%:t") .. ":" .. vim.fn.line("."))
end, { desc = "Copy the current filename:line to the + reg" })

vim.g.autoformat = false

-- general config
vim.cmd [[
  set tabstop=4 expandtab shiftwidth=4 smarttab
  set copyindent " use tabs when a line is with tabs, spaces when a line is with spaces

  set showmatch " show matching brace when inserting a closeing brace

  set noerrorbells
  set belloff=esc " no bell when hitting esc in normal mode

  set matchpairs+=<:>

  " Align switch statements with case labels
  set cino=l1
  " Scope declarations aligned with block
  set cino=g0

  set listchars=tab:>·,trail:_,extends:>,precedes:<
  set list

  set wrap
]]

-- colors
vim.cmd([[
  hi Normal guibg=NONE ctermbg=NONE
  hi NormalNC guibg=NONE ctermbg=NONE
]])
