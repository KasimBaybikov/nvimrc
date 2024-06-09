vim.opt.termguicolors = true
require("bufferline").setup {
	options = {
		mode = 'tabs',
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer" --[[ | function  ]],
				-- text = function()
				-- 	return vim.fn.getcwd()
				-- end,
				text_align = "left", --[[ | "center" | "right" ]]
				separator = true
			}
		},
	}
}
