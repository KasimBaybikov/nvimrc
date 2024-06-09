require("dapui").setup(
-- default
	{
		controls = {
			element = "repl",
			enabled = true,
			icons = {
				disconnect = "",
				pause = "",
				play = "",
				run_last = "",
				step_back = "",
				step_into = "",
				step_out = "",
				step_over = "",
				terminate = ""
			}
		},
		element_mappings = {},
		expand_lines = true,
		floating = {
			border = "single",
			mappings = {
				close = { "q", "<Esc>" }
			}
		},
		force_buffers = true,
		icons = {
			collapsed = "",
			current_frame = "",
			expanded = ""
		},
		layouts = { {
			elements = { {
				id = "stacks",
				size = 0.25
			}, {
				id = "breakpoints",
				size = 0.25
			}, {
				id = "scopes",
				size = 0.25
			}, {
				id = "watches",
				size = 0.25
			} },
			position = "left",
			size = 90
		},
			{
				elements = { {
					id = "repl",
					size = 1.0
				},
					-- {
					-- 	id = "console",
					-- 	size = 0.0
					-- },
				},
				position = "bottom",
				size = 7
			}
		},
		mappings = {
			edit = "e",
			expand = { "o", "<CR>", "<2-LeftMouse>" },
			open = "i",
			remove = "d",
			repl = "r",
			toggle = "t"
		},
		render = {
			indent = 1,
			max_value_lines = 100
		}
	}
)
