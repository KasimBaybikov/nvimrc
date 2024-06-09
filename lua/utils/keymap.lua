local utils = {}

-- keymap function
function utils.keymap(mode, lhs, rhs, desc)
	local opts = { noremap = true, silent = true, desc = desc }
	vim.keymap.set(mode, lhs, rhs, opts)
end

function utils.delete(mode, lhs, desc)
	local opts = { noremap = true, silent = true, desc = desc }
	vim.keymap.del(mode, lhs, opts)
end

return utils
