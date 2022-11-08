local lsp = require('lspconfig')

lsp.tsserver.setup {}
lsp.sumneko_lua.setup {}

local neogit = require('neogit')

neogit.setup {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }}

  require("catppuccin").setup {
    highlight_overrides = {
      all = function (colors)
        return {
          LineNr = { fg = colors.mauve },
        }
      end,
    },
  }

  require('telescope').setup{
    defaults = { file_ignore_patterns = {"node_modules"} }
  }

  require'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all"
    ensure_installed = { "typescript", "lua", "ruby" },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = false,


    ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
    -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

    highlight = {
      -- `false` will disable the whole extension
      enable = true,

      -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
      -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
      -- the name of the parser)
      -- list of language that will be disabled
      -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
      disable = function(_, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
          return true
        end
      end,

      -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
      -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
      -- Using this option may slow down your editor, and you may see some duplicate highlights.
      -- Instead of true it can also be a list of languages
      additional_vim_regex_highlighting = false,
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
  map("n", "<Leader>pe", ":Ntree<CR>")

  -- git
  map("n", "<Leader>gs", ":Neogit<CR>", { silent = true }) 
  map("n", "<Leader>gc", ":Neogit commit<CR>", { silent =  true })
