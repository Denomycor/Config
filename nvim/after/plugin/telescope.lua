require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>pr', require('telescope.builtin').oldfiles, { desc = '[P]roject [R]ecent Files' })
--vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>b', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[b] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>pg', require('telescope.builtin').git_files, { desc = '[P]roject [G]it Files' })
vim.keymap.set('n', '<leader>pf', require('telescope.builtin').find_files, { desc = '[P]roject [F]iles' })
vim.keymap.set('n', '<leader>pd', require('telescope.builtin').diagnostics, { desc = '[P]roject [D]iagnostics' })
vim.keymap.set('n', '<leader>pt', require('telescope.builtin').live_grep, { desc = '[P]roject [T]okens' })
--vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
--vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
