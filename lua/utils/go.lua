local utils = {}

-- function for fill go structs
function utils.fill_go_struct()
	local nline = vim.api.nvim_win_get_cursor(0)[1] - 1
	local char = vim.api.nvim_win_get_cursor(0)[2]

	vim.lsp.buf.execute_command({
		arguments = { {
			Fix = "fill_struct",
			Range = { ["end"] = { character = char, line = nline }, start = { character = char - 1, line = nline } },
			URI = vim.uri_from_bufnr(0)
		} },
		command = "gopls.apply_fix"
	})
end

local ts_utils = require("nvim-treesitter.ts_utils")

local function _get_parent_gostruct_name()
	local node = ts_utils.get_node_at_cursor()
	while node do
		if node:type() == "struct_type" then
			break
		end
		local prev = ts_utils.get_previous_node(node, false, false)
		if prev == nil then
			node = node:parent()
		else
			node = prev
		end
	end
	if node == nil then
		return nil
	end

	local structNameNode = ts_utils.get_previous_node(node, false, false)

	return vim.treesitter.get_node_text(structNameNode, 0)
end

local function _get_current_filename()
	return vim.fn.expand("%:p")
end

local function _modifytags_get_struct_name()
	local structName = _get_parent_gostruct_name()
	if structName == nil then
		error("struct not found. place the cursor inside struct")
	end

	return structName
end

local function _modifytags_get_tagname(args)
	local tag = args.fargs[1]
	if tag == nil then
		error("it needs to enter a tag")
		return
	end

	return tag
end

-- function for add tags to go struct
function utils.modifytags_add_tags(args)
	local structName = _modifytags_get_struct_name()
	local tag = _modifytags_get_tagname(args)
	local fn = _get_current_filename()
	local cmd = ":! gomodifytags -w -file " .. fn .. " -struct " .. structName .. " -add-tags " .. tag
	vim.api.nvim_exec(cmd, true)
end

-- function for remove tags from go struct
function utils.modifytags_remove_tags(args)
	local structName = _modifytags_get_struct_name()
	local tag = _modifytags_get_tagname(args)
	local fn = _get_current_filename()
	local cmd = ":! gomodifytags -w -file " .. fn .. " -struct " .. structName .. " -remove-tags " .. tag
	vim.api.nvim_exec(cmd, true)
end

return utils
