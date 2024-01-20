return {
  { "echasnovski/mini.pairs", enabled = false },
  {
    "kelly-lin/ranger.nvim",
    config = function()
      require("ranger-nvim").setup({ replace_netrw = true })
      vim.api.nvim_set_keymap("n", "<Leader>af", "", {
        noremap = true,
        callback = function()
          require("ranger-nvim").open(true)
        end,
      })
    end,
  },
  {
    "folke/flash.nvim",
    keys = {
      { "s", mode = { "n", "e", "o" }, false },
    },
  },
}
