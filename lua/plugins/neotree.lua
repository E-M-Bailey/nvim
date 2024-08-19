return {
	'nvim-neo-tree/neo-tree.nvim',

	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-tree/nvim-web-devicons',
		'MunifTanjim/nui.nvim',
	},

	config = function()
		require 'neo-tree'.setup({
			source_selector = {
				winbar = true,
				statusline = false,
			}
		})

		Remap_neotree()
	end
}
