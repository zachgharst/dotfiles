return {
  "CopilotC-Nvim/CopilotChat.nvim",
  dependencies = {
    { "nvim-lua/plenary.nvim", },
  },
  build = "make tiktoken",
  keys = {
    { "<leader>cc", "<cmd>CopilotChat<cr>", desc = "Open Copilot Chat" },
  },
}
