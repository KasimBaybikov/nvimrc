-- Filetype
vim.filetype.add({
	filename = {
		[require('os').getenv('HOME') .. '/.kube/config'] = "yaml",
	},
	extension = {
		brief = "brief",
	},
})
