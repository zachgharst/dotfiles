return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  version = false,
  build = ":TSUpdate",
  lazy = false,
  config = function()
    require("nvim-treesitter").install({
      "bash",
      "c_sharp",
      "diff",
      "html",
      "javascript",
      "json",
      "lua",
      "markdown",
      "markdown_inline",
      "powershell",
      "query",
      "regex",
      "sql",
      "tsx",
      "typescript",
      "vim",
      "vimdoc",
      "xml",
      "yaml",
    })
}
