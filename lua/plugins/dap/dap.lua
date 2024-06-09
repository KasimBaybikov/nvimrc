require('dap-go').setup()

vim.api.nvim_set_hl(0, "blue", { fg = "#FF5555" })
vim.fn.sign_define('DapBreakpoint', { text = '⬤', texthl = 'blue', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
