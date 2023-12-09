-- Plugin for fuzzy finder

local aerial = require("aerial")
local telescope = require("telescope")

aerial.setup()
telescope.load_extension('aerial')

telescope.setup {
	defaults = {
		mappings = {
			i = {
				["<S-k>"] = require("telescope.actions").preview_scrolling_up,
				["<S-J>"] = require("telescope.actions").preview_scrolling_down,
			},
			n = {
				["<S-k>"] = require("telescope.actions").preview_scrolling_up,
				["<S-J>"] = require("telescope.actions").preview_scrolling_down,
				["s"] = require("telescope.actions").file_vsplit,
				["t"] = require("telescope.actions").file_tab,
				["<CR>"] = require("telescope.actions").select_default + require("telescope.actions").center,
				["o"] = require("telescope.actions").select_default + require("telescope.actions").center,
			}
		}
	},

	extensions = {
		aerial = {
			-- Display symbols as <root>.<parent>.<symbol>
			show_nesting = {
				['_'] = false, -- This key will be the default
				json = true,   -- You can set the option for specific filetypes
				yaml = true,
			}
		},
	}
}

