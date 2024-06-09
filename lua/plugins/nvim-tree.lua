-- Plugin for the catolog tree


-- pass to setup along with your other options
require("nvim-tree").setup {
	---
	on_attach = require("remaps.nvim-tree").my_on_attach,

	filters = {
		dotfiles = false,
		git_ignored = false
	},
	view = {
		float = {
			enable = true,
			quit_on_focus_loss = false,
			open_win_config = function()
				local HEIGHT_RATIO = 0.8 -- You can change this
				local WIDTH_RATIO = 0.5 -- You can change this too
				local screen_w = vim.opt.columns:get()
				local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
				local window_w = screen_w * WIDTH_RATIO
				local window_h = screen_h * HEIGHT_RATIO
				local window_w_int = math.floor(window_w)
				local window_h_int = math.floor(window_h)
				local center_x = (screen_w - window_w) / 2
				local center_y = ((vim.opt.lines:get() - window_h) / 2)
					- vim.opt.cmdheight:get()
				return {
					border = 'single',
					relative = 'editor',
					row = center_y,
					col = center_x,
					width = window_w_int,
					height = window_h_int,
				}
			end,
		},
	},
	renderer = {
		indent_markers = {
			enable = true,
			inline_arrows = true,
			icons = {
				corner = "└",
				edge = "│",
				item = "│",
				bottom = "─",
				none = " ",
			},
		},
	}

}
