vim.g.mapleader = " "

-- Move things while highlighted
vim.keymap.set("v", "<A-Up>", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<A-Down>", ":m '>+1<CR>gv=gv")

-- Move next line to current line with a space
vim.keymap.set("n", "J", "mzJ`z")

-- Move half a page
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Keep cursor in the middle while in search
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Replace highlighted word without changing the register
vim.keymap.set("x", "<leader>p", [["_dP]])

-- System clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

--vim.keymap.set("n", "Q", "<nop>")
--vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Format code
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Navigate through lsp
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Replace selected word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Make executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Clear search
vim.keymap.set("n", "<leader>h", "<cmd>noh<CR>")

-- Select text
vim.keymap.set("n", "F", "#*")
vim.keymap.set("v", "F", 'y/\\V<C-r>"')

-- Split Window
vim.keymap.set("n", "<leader>vv", "<C-w>v")
vim.keymap.set("n", "<leader>vh", "<C-w>v")

-- Switch Window
vim.keymap.set("n", "<leader>w", "<C-w>w")

-- Quick Save
vim.keymap.set("n", "<C-s>", "<cmd>w<CR>")

