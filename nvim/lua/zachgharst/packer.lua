-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use('wbthomason/packer.nvim')

  use('Olical/conjure')
  use('othree/html5.vim')
  use('pangloss/vim-javascript')
  use('evanleck/vim-svelte')
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn['mkdp#util#install']() end,
  })

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' }, -- Required
      {                            -- Optional
        'williamboman/mason.nvim',
        run = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },     -- Required
      { 'hrsh7th/cmp-nvim-lsp' }, -- Required
      { 'L3MON4D3/LuaSnip' },     -- Required
    }
  }

  use({
    'folke/trouble.nvim',
    requires = { { 'nvim-tree/nvim-web-devicons' } }
  })

  use({
    'nvim-neotest/neotest',
    requires = {
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-treesitter/nvim-treesitter',
      'Issafalcon/neotest-dotnet',
    }
  })

  use('mrcjkb/rustaceanvim')
end)
