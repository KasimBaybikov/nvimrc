-- Set leader
vim.g.mapleader = " "

-- Copy in OS buffer
vim.keymap.set("v", "<C-y>", "\"*y")

-- Split movement
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Tab movement
vim.keymap.set("n", "<S-l>", "gt")
vim.keymap.set("n", "<S-h>", "gT")

-- Nvim Tree
vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>")

-- Moving lines in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Each subsequent stay in the center
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Inserting without copying the text in which you inserted
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Fast regular expression
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Set chmod +/- x
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
vim.keymap.set("n", "<leader>X", "<cmd>!chmod -x %<CR>", { silent = true })

-- Disable q:
vim.keymap.set("n", "q:", "<Nop>")

-- LSP
vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
vim.keymap.set('i', '<C-k>', function() require('lsp_signature').toggle_float_win() end)
vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
vim.keymap.set('n', 'gD', '<cmd>Telescope lsp_implementations<CR>')
vim.keymap.set('n', 'gb', '<C-o>')
vim.keymap.set('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
vim.keymap.set('n', '<leader>F', '<cmd>lua vim.lsp.buf.format()<CR>')
vim.keymap.set('n', '<leade>r', '<cmd>Telescope lsp_references<CR>')
vim.keymap.set('n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<CR>')

-- Telescope
local builtin = require('telescope.builtin')
-- find files
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
-- find git files
vim.keymap.set('n', '<leader>g', builtin.git_status, {})

-- find in opened file
vim.keymap.set('n', '<leader>fs', builtin.current_buffer_fuzzy_find, {})

-- Live grep
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

-- Find functions in file
vim.keymap.set('n', '<leader>gf', ":Telescope aerial<CR>", {})

-- find errors
vim.keymap.set('n', '<leader>ge', ":Telescope diagnostics<CR>", {})

-- Git
vim.keymap.set("n", "<leader>gd", "<cmd>Gitsigns diffthis<CR><C-w>h")

--Gomft
vim.keymap.set("n", "<leader>fmt", "<cmd>!gofmt -w %<CR><CR>")
