local utils = {}

function utils.project_search_and_replace(opts)
	local fw = opts.fargs[1]
	local nw = opts.fargs[2]

	vim.cmd("vimgrep " .. fw .. " **/*")
	vim.cmd("cfdo %s/" .. fw .. "/" .. nw .. "/gc | update")
end

return utils
