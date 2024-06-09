local set = require("utils.keymap").keymap

local dap = {}

-- set('n', '<leader>dr', function() require("dapui").open({ reset = true }) end)

local isOpen = false

local function execAndAddEnterKeymap(f)
	return function()
		f()
		vim.keymap.set('n', '<CR>', f)
	end
end

local function execAndDeleteEnterKeymap(f)
	return function()
		f()
		vim.keymap.set('n', '<CR>', '<CR>')
	end
end

function dap.open_dapui()
	isOpen = true
	require("nvim-tree.api").tree.close()
	require("dapui").close()
	require('dapui').open({ reset = true })
end

function dap.close_dapui()
	isOpen = false
	vim.keymap.set('n', '<CR>', '<CR>')

	require("dapui").close()
end

-- update toggle
set('n', '<leader>do', function()
	if isOpen == false then
		dap.open_dapui()
	else
		dap.close_dapui()
	end
end)

set('n', '<leader>dr', function()
	require("dapui").close()
	require('dapui').open({ reset = true })
	isOpen = true
end)

set('n', '<leader>b', function() require('dap').toggle_breakpoint() end)


set('n', '<leader>dq', function()
	require('dap').terminate()
	vim.keymap.set('n', '<CR>', '<CR>')
end)

set('n', '<leader>dq', function()
	execAndDeleteEnterKeymap(require('dap').terminate)
	require('dap').disconnect({ terminateDebuggee = true })
end)

-- set('n', '<leader>c', function() require('dap').continue() end)
-- set('n', '<leader>i', function() require('dap').step_into() end)
-- set('n', '<leader>o', function() require('dap').step_over() end)
-- set('n', '<leader>q', function() require('dap').step_out() end)
set('n', '<leader>c', execAndAddEnterKeymap(require('dap').continue))
set('n', '<leader>i', execAndAddEnterKeymap(require('dap').step_into))
set('n', '<leader>o', execAndAddEnterKeymap(require('dap').step_over))
set('n', '<leader>q', execAndAddEnterKeymap(require('dap').step_out))


return dap
-- сделать нормальное открытие в scopes
