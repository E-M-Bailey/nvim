return {
	'stevearc/conform.nvim',
	dependencies = {
		'williamboman/mason.nvim',
		'LittleEndianRoot/mason-conform',
	},

	config = function()
		require 'conform'.setup({
			formatters_by_ft = {
				-- awk = { 'awk' },
				c = { 'clang-format' },
				cpp = { 'clang-format' },
				-- javascript = { 'prettierd', 'prettier', stop_after_first = true },
				-- haskell = { 'ormolu' },
				lua = { 'stylua' },
				python = { 'rustfmt' },
				-- rust = { 'rustfmt', lsp_format = 'fallback' }
			}
		})
	end
}
