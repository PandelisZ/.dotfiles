require('plugins')
local lsp = require('lspconfig')

lsp.tsserver.setup {}

local neogit = require('neogit')

neogit.setup {}

require("catppuccin").setup {
  highlight_overrides = {
    all = function (colors) 
      return {
        LineNr = { fg = colors.mauve },
      }
    end,
    },
}

vim.o.number = true
vim.o.relativenumber = true
vim.g.mapleader = ' '
vim.cmd("colorscheme catppuccin")

vim.opt.guicursor =  ''

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.smartindent = true

vim.opt.wrap = false


-- Functional wrapper for mapping custom keybindings
function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end





map("n", "<Leader>ff", ":Telescope find_files<CR>")
map("n", "<Leader>fb", ":Telescope buffers<CR>")

-- quicksave
map("n", "<Leader>s", ":update<CR>")


-- git
map("n", "<Leader>gs", ":Neogit<CR>", { silent = true }) 
map("n", "<Leader>gc", ":Neogit commit<CR>", { silent =  true })
