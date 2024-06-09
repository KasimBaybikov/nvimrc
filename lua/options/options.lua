local options = {
	tabstop = 4,
	shiftwidth = 4,
	softtabstop = 4,
	number = true,
	-- relativenumber = false,
	encoding = "utf-8",
	swapfile = false,
	wrap = false,
	-- wrap = true,
	mouse = "",
	smartindent = true,
	undofile = true,
	undodir = os.getenv("HOME") .. "/.nvim/undodir",
	listchars = { space = ' ', tab = '>- ', eol = '¬', trail = '~', extends = '>', precedes = '<' },
	list = true,
	scrolloff = 10,
	sidescrolloff = 15,
	langmap =
	"ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz",
}

for k, v in pairs(options) do
	vim.opt[k] = v
end
