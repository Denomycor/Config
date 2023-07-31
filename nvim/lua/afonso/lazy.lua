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
        },
    },

    -- Github Theme
    {
        'projekt0n/github-nvim-theme',
        tag = 'v0.0.7',
        priority = 1000,
        config = function()
            require('github-theme').setup({
                theme_style = "dark_default",
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

    -- Misc
    { 'numToStr/Comment.nvim',      opts = {} },
    { 'ThePrimeagen/harpoon' },
    { "windwp/nvim-autopairs",      opts = {} },
    { 'nvim-tree/nvim-web-devicons' },
    { 'nvim-tree/nvim-tree.lua' },
    {
        'madskjeldgaard/cppman.nvim',
        dependencies = {
            'MunifTanjim/nui.nvim'
        }
    },

    -- Telescope
    { 'nvim-telescope/telescope.nvim', branch = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim' } },

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

    --[[ Signature helper
    {
        "ray-x/lsp_signature.nvim",
        opts = {
            hint_prefix = "-> "
        }
    },]]

}, {})
