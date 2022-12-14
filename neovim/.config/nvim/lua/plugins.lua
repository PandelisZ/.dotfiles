return require('packer').startup(function(use)
  use { 'wbthomason/packer.nvim'}
  use 'folke/tokyonight.nvim'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use { 'neoclide/coc.nvim', branch = 'release' }
  use { "catppuccin/nvim", as = "catppuccin" }
  use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
  use { 'neovim/nvim-lspconfig' } -- Configurations for Nvim LSP
  use { 'jose-elias-alvarez/null-ls.nvim' }
  use { 'MunifTanjim/eslint.nvim' }
  use { 'nvim-telescope/telescope.nvim', tag = '0.1.0' }
  use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  })
end)
