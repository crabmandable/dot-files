-- bootstrap lazy.nvim, LazyVim and your plugins
vim.g.mapleader = ","
vim.g.maplocalleader = ","

require("config.lazy")

local ranger_nvim = require("ranger-nvim")
ranger_nvim.setup({
    enable_cmds = false,
    replace_netrw = false,
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

-- vim.api.nvim_create_user_command("Rg", "lua vim.cmd('silent grep! test | copen')", {})

vim.cmd([[
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
]])
