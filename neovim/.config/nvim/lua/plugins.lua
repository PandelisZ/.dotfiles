return require('packer').startup(function(use)
	use { "catppuccin/nvim", as = "catppuccin" }
	use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
end)
