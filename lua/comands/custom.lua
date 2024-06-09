-- Recursive replace symbols in project
vim.api.nvim_create_user_command(
	"Replace",
	require("utils.comands").project_search_and_replace,
	{ nargs = "*" }
)
