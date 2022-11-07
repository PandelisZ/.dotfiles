return require('packer').startup(function(use)
	use { 'wbthomason/packer.nvim'}
	use 'folke/tokyonight.nvim'
	use { "catppuccin/nvim", as = "catppuccin" }
	use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
	use { 'neovim/nvim-lspconfig' } -- Configurations for Nvim LSP
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
