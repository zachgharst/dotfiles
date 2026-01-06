return   {
  "neovim/nvim-lspconfig",
  lazy = false,
  "mason.nvim",
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "omnisharp",
        "lua_ls",
      },
    },
  },
  config = function()
    vim.lsp.config['omnisharp'] = {
      filetypes = { "cs" },
      cmd = { "OmniSharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
    }
  end,
}
