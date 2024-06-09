-- sort imports in go
-- old
-- vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
-- 	pattern = '*.go',
-- 	callback = function()
-- 		local params = vim.lsp.util.make_range_params(nil, vim.lsp.util._get_offset_encoding())
-- 		params.context = { only = { 'source.organizeImports' } }
-- 		local result = vim.lsp.buf_request_sync(0, 'textDocument/codeAction', params, 3000)
-- 		for _, res in pairs(result or {}) do
-- 			for _, r in pairs(res.result or {}) do
-- 				if r.edit then
-- 					vim.lsp.util.apply_workspace_edit(r.edit, vim.lsp.util._get_offset_encoding())
-- 				else
-- 					vim.lsp.buf.execute_command(r.command)
-- 				end
-- 			end
-- 		end
-- 	end,
-- })

-- Automatic display of error messages
-- vim.api.nvim_create_autocmd({ "CursorHold", --[[ "CursorHoldI" ]] }, {
-- 	callback = vim.diagnostic.open_float
-- })

-- autoformating for go
vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
	pattern = '*',
	callback = function()
		vim.lsp.buf.format()
	end
})


-- sort imports gopls
-- https://github.com/golang/tools/blob/master/gopls/doc/vim.md#neovim-imports
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.go",
	callback = function()
		local params = vim.lsp.util.make_range_params()
		params.context = { only = { "source.organizeImports" } }
		-- buf_request_sync defaults to a 1000ms timeout. Depending on your
		-- machine and codebase, you may want longer. Add an additional
		-- argument after params if you find that you have to write the file
		-- twice for changes to be saved.
		-- E.g., vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
		local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
		for cid, res in pairs(result or {}) do
			for _, r in pairs(res.result or {}) do
				if r.edit then
					local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
					vim.lsp.util.apply_workspace_edit(r.edit, enc)
				end
			end
		end
		vim.lsp.buf.format({ async = false })
	end
})
