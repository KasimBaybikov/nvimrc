require("mason").setup()
require("mason-lspconfig").setup()

local has_words_before = function()
	unpack = unpack or table.unpack
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup({
	window = {
		completion = {
			border = "single",
			winhighlight = "Normal:Normal,FloatBorder:Normal,Search:Normal",
		},
		documentation = {
			border = "single",
			winhighlight = "Normal:Normal,FloatBorder:Normal,Search:Normal",
		}
	},
	experimental = {
		ghost_text = true
	},
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
	mapping = {
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
		["<C-e>"] = cmp.mapping({
			i = function()
				if cmp.visible() then
					cmp.abort()
				else
					cmp.complete()
				end
			end,
			c = function()
				if cmp.visible() then
					cmp.close()
				else
					cmp.complete()
				end
			end,
		}),
		["<CR>"] = cmp.mapping(cmp.mapping.confirm({ select = false }), { 'i', 'c' })
	},

	formatting = {
		format = require('lspkind').cmp_format({
			mode = 'symbol_text',
		}),
	},

	sources = cmp.config.sources({
			{ name = 'nvim_lsp' },
			{ name = 'luasnip' },
		},
		{
			{ name = 'buffer' },
		}),
})

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

local border = {
	{ "┌", "FloatBorder" },
	{ "─", "FloatBorder" },
	{ "┐", "FloatBorder" },
	{ "│", "FloatBorder" },
	{ "┘", "FloatBorder" },
	{ "─", "FloatBorder" },
	{ "└", "FloatBorder" },
	{ "│", "FloatBorder" },
}


local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
	opts = opts or {}
	opts.border = opts.border or border
	return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

require("mason-lspconfig").setup_handlers {
	function(server_name)
		local opts = {
			capabilities = capabilities
		}
		require("lspconfig")[server_name].setup(opts)
	end,
}

-- message on line
vim.diagnostic.config({ virtual_text = true })

-- Lua 'Undefined global 'vim'
local lspconfig = require('lspconfig')

lspconfig.lua_ls.setup {
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using
				-- (most likely LuaJIT in the case of Neovim)
				version = 'LuaJIT',
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = {
					'vim',
					'require'
				},
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
}

require("lspconfig")["gopls"].setup({
	capabilities = capabilities,
	-- on_attach = on_attach,
	settings = {
		gopls = {
			buildFlags = { "-tags=integration" },
			gofumpt = true,
			codelenses = {
				gc_details = true,
				generate = true,
				run_govulncheck = true,
				test = true,
				tidy = true,
				upgrade_dependency = true,
			},
			hints = {
				assignVariableTypes = true,
				compositeLiteralFields = true,
				compositeLiteralTypes = true,
				constantValues = true,
				functionTypeParameters = true,
				parameterNames = true,
				rangeVariableTypes = true,
			},
			analyses = {
				nilness = true,
				unusedparams = true,
				unusedvariable = true,
				unusedwrite = true,
				useany = true,
			},
			staticcheck = true,
			directoryFilters = { "-.git", "-node_modules" },
			semanticTokens = true,
		},
	},
})

local nvim_lsp = require("lspconfig")
local configs = require("lspconfig.configs")
local util = require("lspconfig.util")

-- Inject Brief LSP
if not configs.briefls then
	configs.briefls = {
		default_config = {
			cmd = { "briefls" },
			filetypes = { "brief" },
			root_dir = function(fname)
				util.find_git_ancestor(fname)
			end,
			single_file_support = true,
		},
		settings = {},
	}
end

-- Setup server
nvim_lsp.briefls.setup({
	-- on_attach = on_attach,
	flags = {
		debounce_text_changes = 150,
	},
	capabilities = capabilities,
})
