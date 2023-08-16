vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Install package manager
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    }
end
vim.opt.rtp:prepend(lazypath)


require('lazy').setup({

    -- LSP
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            { 'williamboman/mason.nvim', config = true },
            'williamboman/mason-lspconfig.nvim',
            { 'j-hui/fidget.nvim',       tag = 'legacy', opts = {} },
        },
    },

    -- Autocompletion
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'rafamadriz/friendly-snippets',
            'hrsh7th/cmp-nvim-lsp-signature-help',
            'hrsh7th/cmp-path',
        },
    },

    -- Github theme
    {
        'projekt0n/github-nvim-theme',
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            require('github-theme').setup({

            })

        end,
    },

    -- Lualine
    { 'nvim-lualine/lualine.nvim' },

    -- Indent
    {
        'lukas-reineke/indent-blankline.nvim',
        opts = {
            space_char_blankline = " ",
            show_current_context = true,
            show_current_context_start = true,
        },
    },

    -- Undotree
    { 'mbbill/undotree' },

    -- Comment
    { 'numToStr/Comment.nvim',      opts = {} },

    -- Harpoon
    { 'ThePrimeagen/harpoon' },

    -- Autopairs
    { "windwp/nvim-autopairs",      opts = {} },

    -- Nvim tree
    { 'nvim-tree/nvim-tree.lua' },
    { 'nvim-tree/nvim-web-devicons' },

    -- Cppman
    {
        'madskjeldgaard/cppman.nvim',
        dependencies = {
            'MunifTanjim/nui.nvim'
        }
    },

    -- Telescope
    { 'nvim-telescope/telescope.nvim',          branch = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim' } },

    -- Fuzzy finder telescope
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
            return vim.fn.executable 'make' == 1
        end,
    },

    -- Treesitter
    {
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        build = ':TSUpdate',
    },
    { 'nvim-treesitter/nvim-treesitter-context' },

    -- Gitsigns
    { 'lewis6991/gitsigns.nvim' },

    -- Which-key
    { 'folke/which-key.nvim',                   opts = {} },



    --[[ Signature helper
    {
        "ray-x/lsp_signature.nvim",
        opts = {
            hint_prefix = "-> "
        }
    },]]

}, {})
