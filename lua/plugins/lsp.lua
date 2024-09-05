return {
	'neovim/nvim-lspconfig',
	dependencies = {
		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-path',
		'hrsh7th/cmp-cmdline',
		'hrsh7th/nvim-cmp',
		'L3MON4D3/LuaSnip',
		'saadparwaiz1/cmp_luasnip',
		'j-hui/fidget.nvim',
	},

	config = function()
		local cmp = require('cmp')
		local cmp_lsp = require('cmp_nvim_lsp')
		local cap = vim.tbl_deep_extend(
			'force',
			{},
			vim.lsp.protocol.make_client_capabilities(),
			cmp_lsp.default_capabilities()
		)

		require('fidget').setup({})
		require('mason').setup({})
		require('mason-lspconfig').setup({
			-- See https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
			-- or run :help lspconfig-all
			ensure_installed = {
				'asm_lsp',
				'autotools_ls',
				'bashls',
				'clangd',
				-- 'csharp_ls',
				-- 'cssls',
				-- 'dockerls',
				-- 'eslint',
				-- 'fortls',
				-- 'glslls',
				-- 'gopls',
				-- 'hls',
				'jsonls',
				-- 'lemminx',
				'lua_ls',
				'neocmake',
				'ocamllsp',
				'pylsp',
				'remark_ls',
				-- 'rust_analyzer',
				-- 'sqls',
				-- 'ts_ls',
				'vimls',
				-- 'zls',
			},
			handlers = {
				function(serv)
					require 'lspconfig'[serv].setup({
						capabilities = cap
					})
				end,
				['remark_ls'] = function()
					require 'lspconfig'.remark_ls.setup({
						settings = {
							remark = {
								requireConfig = true
							}
						}
					})
				end
			}
		})

		local cmp_select = { behavior = cmp.SelectBehavior.Select }

		cmp.setup({
			snippet = {
				expand = function(args)
					require('luasnip').lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
				['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
				['<C-y>'] = cmp.mapping.confirm({ select = true }),
				['<C-Space>'] = cmp.mapping.complete(),
			}),
			sources = cmp.config.sources({
				{ name = 'nvim_lsp' },
				{ name = 'luasnip' },
			}, {
				{ name = 'buffer' },
			})
		})
	end
}

