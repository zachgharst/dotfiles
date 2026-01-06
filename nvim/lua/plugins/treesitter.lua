return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  version = false,
  build = ":TSUpdate",
  lazy = false,
  config = function()
    require("nvim-treesitter").install({
      -- these should always be installed; required by most plugins
      "c",
      "lua",
      "vim",
      "vimdoc",
      "query",
      "markdown",

      -- optional/my needed parsers
      "bash",
      "c_sharp",
      "diff",
      "html",
      "javascript",
      "json",
      "powershell",
      "regex",
      "sql",
      "tsx",
      "typescript",
      "xml",
      "yaml",
    })
  end,
}
