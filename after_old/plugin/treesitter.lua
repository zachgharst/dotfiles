local required_parsers = {
  -- these should always be intalled; required by nvim/treesitter
  "c",
  "lua",
  "vim",
  "vimdoc",
  "query",
  "markdown",
  "markdown",

  -- optional
  "javascript",
  "typescript",
  "json",
}

require('nvim-treesitter.configs').setup({
  ensure_installed = required_parsers,
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    disable = function(lang, buf)
      local max_filesize = 1024 * 1024 -- 1 MB
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      if ok and stats and stats.size > max_filesize then
        return true
      end
    end,
    additional_vim_regex_highlighting = false,
  },
})
