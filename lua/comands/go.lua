-- GoTagAdd
vim.api.nvim_create_user_command(
	"GoTagAdd",
	require("utils.go").modifytags_add_tags,
	{ desc = "gomodifytags add tags", nargs = 1 }
)

-- GoTagRemove
vim.api.nvim_create_user_command(
	"GoTagRemove",
	require("utils.go").modifytags_remove_tags,
	{ desc = "gomodifytags remove tags", nargs = 1 }
)


-- GoRun
-- vim.api.nvim_create_user_command(
-- 	"GoRun",
-- 	require("utils.go").modifytags_remove_tags,
-- 	{ desc = "go run %", nargs = 1 }
-- )

-- set('n', '<leader>gr', '<cmd>!go run %<CR>')
