-- local set = vim.keymap.set
local set = require("utils.keymap").keymap

-- Disable q:
set("n", "q:", "<Nop>")
set("n", "J", "<Nop>")
-- Copy in OS buffer
set("v", "<C-y>", "\"*y")
-- Split movement
set("n", "<C-h>", "<C-w>h")
set("n", "<C-j>", "<C-w>j")
set("n", "<C-k>", "<C-w>k")
set("n", "<C-l>", "<C-w>l")
-- Tab movement
set("n", "<S-l>", "gt")
set("n", "<S-h>", "gT")
set("n", "<leader>tl", "<cmd>tabmove +1<CR>")
set("n", "<leader>th", "<cmd>tabmove -1<CR>")
-- buffer Moving
set("n", ">", "<C-w>5>")
set("n", "<", "<C-w>5<")
-- Nvim Tree
set("n", "<C-n>", ":NvimTreeToggle<CR>")
-- Moving lines in visual mode
set("v", "J", ":m '>+1<CR>gv=gv")
set("v", "K", ":m '<-2<CR>gv=gv")
-- Each subsequent stay in the center
set("n", "n", "nzzzv")
set("n", "N", "Nzzzv")
-- Inserting without copying the text in which you inserted
set("x", "<leader>p", "\"_dP")
-- Fast regular expression
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- Set chmod +/- x
set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
set("n", "<leader>X", "<cmd>!chmod -x %<CR>", { silent = true })

set("n", "<leader>nn", ":noh<CR>", { silent = true })

---- LSP
local opts = { noremap = true, silent = true }

set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
-- set('i', '<C-k>', function() require('lsp_signature').toggle_float_win() end)
-- set('n', '<C-k>', "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)

-- set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
set('n', 'gd', '<cmd>Telescope lsp_definitions show_line=false<CR>')
set('n', 'gD', '<cmd>Telescope lsp_implementations show_line=false<CR>')
set('n', 'gr', '<cmd>Telescope lsp_references show_line=false<CR>')
set('n', 'gb', '<C-o>')
set('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
set('n', '<leader>F', '<cmd>lua vim.lsp.buf.format()<CR>')
set('n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<CR>')

set("n", "<leader>D", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
set("n", "<leader>dn", "<cmd>lua vim.diagnostic.goto_next({ float = false })<CR>", opts)
set("n", "<leader>dN", "<cmd>lua vim.diagnostic.goto_prev({ float = false })<CR>", opts)

---- Telescope
local builtin = require('telescope.builtin')
-- find git files
-- vim.keymap.set('n', '<leader>tg', builtin.git_status, {})
--
set('n', '<leader>ff', builtin.find_files, {})                -- find files
set('n', '<leader>fb', builtin.current_buffer_fuzzy_find, {}) -- find in opened file
set('n', '<leader>fl', builtin.live_grep, {})                 -- Live grep
set('n', '<leader>tff', ":Telescope aerial<CR>", {})          -- Telescope Find functions
set('n', '<leader>fe', ":Telescope diagnostics<CR>", {})      -- Telescope find errors
set("n", "<leader>tr", ":Telescope resume<CR>")               -- Telescope resume
set("n", "<leader>gd", "<cmd>Gitsigns diffthis<CR><C-w>h")    -- Telescope Git diff
set("n", "B", "<cmd>Gitsigns blame_line<CR>")                 -- Telescope Git diff

---- GO
-- autofill structs go
set('n', '<leader>gfs', require("utils.go").fill_go_struct) -- Go Fill Structs
