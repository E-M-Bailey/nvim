return {
	'justinhj/battery.nvim',
	dependencies = {
		'nvim-tree/nvim-web-devicons',
		'nvim-lua/plenary.nvim'
	},

	config = function()
		require 'battery'.setup({
			update_rate_seconds = 60,
		})
	end
}

