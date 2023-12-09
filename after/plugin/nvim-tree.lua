-- Plugin for the catolog tree

local function my_on_attach(bufnr)
	local api = require "nvim-tree.api"

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	-- default mappings
	api.config.mappings.default_on_attach(bufnr)

	-- custom mappings

	vim.keymap.set('n', 's', api.node.open.vertical, opts('Open: Vertical Split'))
	vim.keymap.set('n', 'i', api.node.open.horizontal, opts('Open: Horizontal Split'))
	vim.keymap.set('n', 't', api.node.open.tab, opts('Open: New Tab'))
	vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
	vim.keymap.set('n', 'C', api.tree.change_root_to_node, opts('CD'))
end

-- pass to setup along with your other options
require("nvim-tree").setup {
	---
	on_attach = my_on_attach,
	---
	actions = {
		open_file = {
			window_picker = {
				enable = false
			}
		}
	},

	renderer = {
		icons = {
			glyphs = {
				folder = {
					arrow_closed = "▸",
					arrow_open = "▾"
				}
			}
		}
	},
	view = {
		adaptive_size = true,
	}

}
