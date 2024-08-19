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
		require('mason').setup()
		require('mason-lspconfig').setup({
			-- See https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
			-- or run :help lspconfig-all
			ensure_installed = {
				'als',
				'angularls',
				'arduino_language_server',
				'asm_lsp',
				'autotools_ls',
				'bashls',
				'cairo_ls',
				'clangd',
				'clojure_lsp',
				'cobol_ls',
				'coq_lsp',
				'csharp_ls',
				'cssls',
				'dockerls',
				'elixirls',
				'elmls',
				'erlangls',
				'eslint',
				'fortls',
				'fsautocomplete',
				'glslls',
				'gopls',
				'gradle_ls',
				'groovyls',
				'hls',
				'jdtls',
				'jsonls',
				'lemminx',
				'lua_ls',
				'matlab_ls',
				'mesonlsp',
				'millet',
				'mm0_ls',
				'neocmake',
				'nginx_language_server',
				'ocamllsp',
				'ols',
				'pbls',
				'perlnavigator',
				'pylsp',
				'r_language_server',
				'remark_ls',
				'ruby_lsp',
				'rust_analyzer',
				'serve_d',
				'sqls',
				'tsserver',
				'vhdl_ls',
				'vimls',
				'zls',
			},
			handlers = {
				function(serv)
					require('lspconfig')[serv].setup({
						capabilities = cap
					})
				end,
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

