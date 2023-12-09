vim.api.nvim_exec('language en_US', true)
vim.opt.mouse = ""

vim.opt.swapfile = false
vim.wo.wrap = false
vim.wo.number = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true

vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.listchars = { space = ' ', tab = '>- ', eol = '¬', trail = '~', extends = '>', precedes = '<' }
vim.opt.list = true

-- autoformating for go
function GoFmt()
	local saved_view = vim.fn.winsaveview()
	vim.cmd('silent %!gofmt')
	if vim.v.shell_error > 0 then
		vim.fn.setline(1, vim.fn.getline(1, '$'):gsub('<standard input>', vim.fn.expand('%')))
		vim.cmd('silent undo')
		vim.cmd('cwindow')
	end
	vim.fn.winrestview(saved_view)
end

vim.cmd [[
	autocmd BufWritePre <buffer> lua vim.lsp.buf.format()
	autocmd BufWritePre *.go lua GoFmt()
	]]

vim.opt_global.updatetime = 300

-- sort imports in go
vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
	pattern = '*.go',
	callback = function()
		local params = vim.lsp.util.make_range_params(nil, vim.lsp.util._get_offset_encoding())
		params.context = { only = { 'source.organizeImports' } }
		local result = vim.lsp.buf_request_sync(0, 'textDocument/codeAction', params, 3000)
		for _, res in pairs(result or {}) do
			for _, r in pairs(res.result or {}) do
				if r.edit then
					vim.lsp.util.apply_workspace_edit(r.edit, vim.lsp.util._get_offset_encoding())
				else
					vim.lsp.buf.execute_command(r.command)
				end
			end
		end
	end,
})
