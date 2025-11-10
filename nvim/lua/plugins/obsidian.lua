return {
  "epwalsh/obsidian.nvim",
  dependencies = { 
    { "nvim-lua/plenary.nvim" },
    { "hrsh7th/nvim-cmp" },
  },
  lazy = true,
  event = {
    "BufReadPre " .. os.getenv("VAULT") .. "/*.md",
    "BufNewFile " .. os.getenv("VAULT") .. "/*.md",
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = os.getenv("VAULT"),
      },
    },
    daily_notes = {
      folder = "dailies",
      alias_format = "%A, %B %-d, %Y",
      template = "daily.md",
    },
    templates = {
      subdir = "templates",
      substitutions = {
        yesterday = function()
          return os.date("%Y-%m-%d", os.time() - 86400)
        end,
        tomorrow = function()
          return os.date("%Y-%m-%d", os.time() + 86400)
        end,
        mmddyyyy = function()
          return os.date("%m-%d-%Y")
        end,
      },
    },
  },
  keys = {
    { "<leader>oo", vim.cmd.ObsidianQuickSwitch, desc = "Obsidian: Quick Switch" },
    { "<leader>on", vim.cmd.ObsidianNew, desc = "Obsidian: New Note" },
    { "<leader>ot", vim.cmd.ObsidianToday, desc = "Obsidian: Today's Note" },
    { "<leader>oy", vim.cmd.ObsidianYesterday, desc = "Obsidian: Yesterday's Note" },
    { "<leader>or", vim.cmd.ObsidianTomorrow, desc = "Obsidian: Tomorrow's Note" },
    { "<leader>od", vim.cmd.ObsidianDailies, desc = "Obsidian: Dailies" },
    { "<leader>os", vim.cmd.ObsidianSearch, desc = "Obsidian: Search" },
    { "<leader>oe", vim.cmd.ObsidianExtractNote, mode = "v", desc = "Obsidian: Extract Note" },
    { "<leader>oi", vim.cmd.ObsidianPasteImg, mode = "v", desc = "Obsidian: Paste Image" },
    { "<leader>og", vim.cmd.ObsidianTags, desc = "Obsidian: Tags" },
  },
}
