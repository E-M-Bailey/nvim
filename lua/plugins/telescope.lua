return {
	'nvim-telescope/telescope.nvim',

	dependencies = {
		'nvim-lua/plenary.nvim',
	},

	config = function()
		require 'telescope'.setup({})

		Remap_telescope()
	end
}
