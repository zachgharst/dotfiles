return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "<C-p>", "<cmd>Telescope git_files<CR>", desc = "Telescope: Git Files" },
    { "<leader>pb", "<cmd>Telescope buffers<CR>", desc = "Telescope: Buffers" },
    { "<leader>pf", "<cmd>Telescope find_files<CR>", desc = "Telescope: Find Files" },
    { "<leader>pg", "<cmd>Telescope grep_string<CR>", desc = "Telescope: Grep Selection" },
    { "<leader>ph", "<cmd>Telescope help_tags<CR>", desc = "Telescope: Help Tags" },
    { "<leader>ps", "<cmd>Telescope live_grep<CR>", desc = "Telescope: Live Grep" },
  },
}
