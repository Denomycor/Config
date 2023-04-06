local lsp = require("lsp-zero")

lsp.preset("recommended")

-- Language Server Providers
lsp.ensure_installed({
    'tsserver',
    'rust_analyzer',
    'pylsp',
    'lua_ls',
    'clangd',
})

-- Fix Undefined global 'vim'
lsp.configure('lua_ls', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

local cmp = require('cmp')
--local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
    -- Previous item on autocomplete
    --['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    -- Next item on autocomplete
    --['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    -- Confirm selected suggestion
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = true,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(_, bufnr)
    local opts = { buffer = bufnr, remap = false }

    -- Jump to definition
    --!vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    --vim.keymap.set("n", "gD", function() vim.lsp.buf.implementation() end, opts)
    --vim.keymap.set("n", "gL", function() vim.lsp.codelens.display() end, opts)
    -- Open information on symbol
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    -- Search for symbol
    --!vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vf", function() vim.diagnostic.open_float() end, opts)
    --!vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    --!vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    -- Open suggested actions
    --!vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    -- View symbol references
    --!vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    -- Rename symbol
    --!vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    --!vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

    -- Jump to end of scope ]}
    -- Jump to sta of scope [{
    -- Jump to previous location <C-o>
end)


lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})
