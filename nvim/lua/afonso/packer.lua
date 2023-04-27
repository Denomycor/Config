vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- LSP server
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            { 'neovim/nvim-lspconfig' },
            {
                'williamboman/mason.nvim',
                build = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' },
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp-signature-help' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'L3MON4D3/LuaSnip' },
        }
    }

    -- Treesitter
    use('nvim-treesitter/nvim-treesitter', { run = 'TSUpdate' })
    use('nvim-treesitter/playground')

    -- Telescope fuzzy finder
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- Github Theme
    use({
        'projekt0n/github-nvim-theme',
        tag = 'v0.0.7',
        config = function()
            require('github-theme').setup({
                theme_style = "dark_default",
            })
        end
    })

    -- Undotree
    use('mbbill/undotree')

    -- Autopairs
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    -- Lualine
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    -- Misc
    use "lukas-reineke/indent-blankline.nvim"
    use 'simrat39/rust-tools.nvim'

    -- LuaTree
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons',
        },
    }

    -- Navigator (must be configed in this file otherwise you'll get an error)
    use({
        "ray-x/navigator.lua",
        requires = {
            { "ray-x/guihua.lua",               run = "cd lua/fzy && make" },
            { "neovim/nvim-lspconfig" },
            { "nvim-treesitter/nvim-treesitter" },
        },
        config = function()
            require("navigator").setup({
                mason = true,

                transparency = 0,

                on_attach = function(_, _)
                    local rt = require('rust-tools')
                    rt.setup({
                        server = {
                            on_attach = function(_, _)
                                rt.inlay_hints.enable()
                            end,
                        },
                    })
                end,

                default_mapping = false,
                icons = {
                    icons = true,
                    code_action_icon = '',
                    code_lens_action_icon = '',
                    diagnostic_head = '',
                    diagnostic_err = ' ',
                    diagnostic_warn = ' ',
                    diagnostic_info = ' ',
                    diagnostic_hint = ' ',
                    diagnostic_head_severity_1 = '',
                    diagnostic_head_severity_2 = '',
                    diagnostic_head_severity_3 = '',
                    diagnostic_head_description = ' ',
                    diagnostic_virtual_text = ' ',
                    diagnostic_file = '',
                    value_changed = '',
                    value_definition = '',
                    side_panel = {
                        section_separator = '',
                        line_num_left = '',
                        line_num_right = '',
                        inner_node = '├○',
                        outer_node = '╰○',
                        bracket_left = '⟪',
                        bracket_right = '⟫',
                    },
                    match_kinds = {
                        var = ' ',
                        method = 'ƒ ',
                        ['function'] = 'ƒ ',
                        parameter = ' ',
                        associated = '',
                        namespace = ' ',
                        type = ' ',
                        field = ' ',
                        module = '',
                        flag = '',
                    },
                    treesitter_defult = '',
                    doc_symbols = '',
                },
                lsp = {
                    code_action = { delay = 5000, enable = true, sign = true, sign_priority = 40, virtual_text = false },
                    code_lens_action = { delay = 5000, enable = true, sign = true, sign_priority = 30,
                        virtual_text = false },
                    format_on_save = false,
                },
                lsp_signature_help = true,

                keymaps = {
                    { key = 'gr', func = require('navigator.reference').async_ref,   desc = 'async_ref' },
                    {
                        key = 'g0',
                        func = require('navigator.symbols').document_symbols,
                        desc = 'document_symbols',
                    },
                    {
                        key = 'gW',
                        func = require('navigator.workspace').workspace_symbol_live,
                        desc = 'workspace_symbol_live',
                    },
                    { key = 'gd', func = require('navigator.definition').definition, desc = 'definition' },
                    { key = 'gD', func = vim.lsp.buf.declaration,                    desc = 'declaration' },

                    {
                        key = 'gt',
                        func = vim.lsp.buf.type_definition,
                        desc = 'type_definition',
                    },
                    {
                        key = 'gp',
                        func = require('navigator.definition').definition_preview,
                        desc = 'definition_preview',
                    },
                    {
                        key = 'gP',
                        func = require('navigator.definition').type_definition_preview,
                        desc = 'type_definition_preview',
                    },
                    { key = '<Leader>gt', func = require('navigator.treesitter').buf_ts,  desc = 'buf_ts' },
                    { key = '<Leader>gT', func = require('navigator.treesitter').bufs_ts, desc = 'bufs_ts' },
                    { key = '<Leader>ct', func = require('navigator.ctags').ctags,        desc = 'ctags' },
                    {
                        key = '<Leader>ca',
                        mode = 'n',
                        func = require('navigator.codeAction').code_action,
                        desc = 'code_action',
                    },
                    {
                        key = '<Leader>ca',
                        mode = 'v',
                        func = require('navigator.codeAction').range_code_action,
                        desc = 'range_code_action',
                    },
                    -- { key = '<Leader>re', func = 'rename()' },
                    { key = '<Leader>rn', func = require('navigator.rename').rename, desc = 'rename' },
                    { key = '<Leader>gi', func = vim.lsp.buf.incoming_calls,         desc = 'incoming_calls' },
                    { key = '<Leader>go', func = vim.lsp.buf.outgoing_calls,         desc = 'outgoing_calls' },
                    { key = 'gi',         func = vim.lsp.buf.implementation,         desc = 'implementation' },
                    { key = '<Leader>D',  func = vim.lsp.buf.type_definition,        desc = 'type_definition' },
                    {
                        key = 'gG',
                        func = require('navigator.diagnostics').show_buf_diagnostics,
                        desc = 'show_buf_diagnostics',
                    },
                    {
                        key = '<Leader>H',
                        func = require('navigator.diagnostics').toggle_diagnostics,
                        desc = 'toggle_diagnostics',
                    },
                    {
                        key = ']d',
                        func = vim.diagnostic.goto_next,
                        desc = 'next diagnostics',
                    },
                    {
                        key = '[d',
                        func = vim.diagnostic.goto_prev,
                        desc = 'prev diagnostics',
                    },
                    { key = '<Leader>ff', func = vim.lsp.buf.format,           mode = 'n', desc = 'format' },
                    { key = '<Leader>ff', func = vim.lsp.buf.range_formatting, mode = 'v', desc = 'range format' },
                    {
                        key = '<Leader>la',
                        mode = 'n',
                        func = require('navigator.codelens').run_action,
                        desc = 'run code lens action',
                    },
                }
            })
        end,
    })

end)

