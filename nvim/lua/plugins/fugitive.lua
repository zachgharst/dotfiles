return {
  "tpope/vim-fugitive",
  event = "VeryLazy",
  keys = {
    { "<leader>gb", ":Git blame<CR>", desc = "Git Blame" },
    { "<leader>gp", ":Git push<CR>", desc = "Git Push" },
    { "<leader>gs", ":Git<CR>", desc = "Git Status" },
  },
}
