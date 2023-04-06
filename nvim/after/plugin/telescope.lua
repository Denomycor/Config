local builtin = require('telescope.builtin')

-- Search project files
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
-- Search git project files
vim.keymap.set('n', '<C-p>', builtin.git_files, {})

-- requires https://github.com/BurntSushi/ripgrep
-- Recursive grep on project files
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

