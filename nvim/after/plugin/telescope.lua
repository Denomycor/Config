local builtin = require('telescope.builtin')

-- Search project files
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
-- Search git project files
vim.keymap.set('n', '<C-p>', builtin.git_files, {})

require("telescope").load_extension('harpoon')

-- requires https://github.com/BurntSushi/ripgrep
-- Recursive grep on project files
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

vim.keymap.set('n', '<leader>ph', '<cmd>Telescope harpoon marks<CR>')

