-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use('wbthomason/packer.nvim')

  use({
    'nvim-telescope/telescope.nvim',
    tag = '0.1.2',
    requires = { { 'nvim-lua/plenary.nvim' } }
  })

  use({
    'rose-pine/neovim',
    as = 'rose-pine',
    config = function()
      vim.cmd('colorscheme rose-pine')
    end
  })

  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
  use('nvim-treesitter/playground')
  use('theprimeagen/harpoon')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')
  use('Olical/conjure')
  use('othree/html5.vim')
  use('pangloss/vim-javascript')
  use('evanleck/vim-svelte')
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn['mkdp#util#install']() end,
  })
  use('github/copilot.vim')

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

  use 'stevearc/dressing.nvim'
  use({
    'ziontee113/icon-picker.nvim',
    config = function()
      require('icon-picker').setup({
        disable_legacy_commands = true
      })
    end,
  })

  use({
    'folke/trouble.nvim',
    requires = { { 'nvim-tree/nvim-web-devicons' } }
  })

  use({
    'nvim-neotest/neotest',
    requires = { { 'Issafalcon/neotest-dotnet' } }
  })

  use({
    "epwalsh/obsidian.nvim",
    tag = "*", -- recommended, use latest release instead of latest commit
    requires = {
      -- Required.
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("obsidian").setup({
        workspaces = {
          {
            name = "personal",
            path = "~/vaults/personal",
          },
          {
            name = "work",
            path = "~/vaults/work",
          },
        },
      })
    end,
  })
end)
