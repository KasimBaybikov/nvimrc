-- vim.api.nvim_create_autocmd({ 'BufAdd', 'TabLeave' }, {
-- 	pattern = '*',
-- 	callback = function()
-- 		require("nvim-tree.api").tree.close_in_all_tabs()
-- 	end
-- })

vim.api.nvim_create_autocmd({ 'BufLeave' }, {
	pattern = '*NvimTree*',
	callback = function()
		require("nvim-tree.api").tree.close_in_all_tabs()
	end
})
