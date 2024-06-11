require("dracula").setup({
	colors = {
		-- Default dracula Colors
		-- bg = "#282A36",
		-- fg = "#F8F8F2",
		-- selection = "#44475A",
		-- comment = "#6272A4",
		-- red = "#FF5555",
		-- orange = "#FFB86C",
		-- yellow = "#F1FA8C",
		-- green = "#50fa7b",
		-- purple = "#BD93F9",
		-- cyan = "#8BE9FD",
		-- pink = "#FF79C6",
		-- bright_red = "#FF6E6E",
		-- bright_green = "#69FF94",
		-- bright_yellow = "#FFFFA5",
		-- bright_blue = "#D6ACFF",
		-- bright_magenta = "#FF92DF",
		-- bright_cyan = "#A4FFFF",
		-- bright_white = "#FFFFFF",
		-- menu = "#21222C",
		-- visual = "#3E4452",
		-- gutter_fg = "#4B5263",
		-- nontext = "#3B4048",
		-- white = "#ABB2BF",
		-- black = "#191A21",
		--
		-- based colors
		bg = "#1B1B1E",
		green = "#8EF593", --functions name
		pink = "#F88ED9", -- keywords
		bright_cyan = "#6FAFFA",
		comment = "#5E61AA", -- comment
		orange = "#FFB86C", -- package golang
		yellow = "#F1FA8C", -- strings golang
		fg = "#F8F8F2",
		selection = "#3A3A3A", -- visual mode nvim
		cyan = "#8BE9FD", -- func

		win_separator = "#24272c",
		status_line_fg = "#8EF593",
		-- status_line_bg = "#20222b",
		status_line_bg = "#1e2029",
		status_line_no_cur_fg = "#5E61AA",
		status_line_no_cur_bg = "#1e2029",

		red = "#FF5555", --erors golang
		menu = "#1C1C1F", --nvim-tree
		-- yellow = "#5f5fff",
		purple = "#BD93F9",
		bright_red = "#FF6E6E",
		bright_green = "#69FF94",
		bright_yellow = "#FFFFA5",
		bright_blue = "#D6ACFF",
		bright_magenta = "#FF92DF",
		bright_white = "#FFFFFF",
		visual = "#3A3A3A",
		gutter_fg = "#4B5263",
		nontext = "#3B4048",
		white = "#ABB2BF",
		black = "#191A21",
		-- debug_cur_line = "#101b0f",

		-- win_separator = "#24272c",
		-- status_line_fg = "#8EF593",
		-- status_line_bg = "#27282b",
		-- status_line_no_cur_fg = "#5E61AA",
		-- status_line_no_cur_bg = "#1e2029",

		-- win_separator = "#24272c",
		-- status_line_fg = "#8EF593",
		-- status_line_bg = "#1e2029",
		-- status_line_no_cur_fg = "#5E61AA",
		-- status_line_no_cur_bg = "#1e2029",
	}
})

vim.cmd([[colorscheme dracula]])
