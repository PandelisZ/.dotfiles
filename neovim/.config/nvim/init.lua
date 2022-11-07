require('plugins')

local neogit = require('neogit')

neogit.setup {}


vim.o.number = true
vim.o.relativenumber = true
vim.g.mapleader = ' '
vim.cmd.colorscheme = "catppuccin"


-- Functional wrapper for mapping custom keybindings
function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("n", "<Leader>gs", ":Neogit<CR>", { silent = true }) 
map("n", "<Leader>gc", ":Neogit commit<CR>", { silent = true }) 


