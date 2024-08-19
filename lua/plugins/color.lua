-- See https://github.com/folke/tokyonight.nvim?tab=readme-ov-file#-tokyo-night
local tn_style = 'night'
local def_color = 'tokyonight-' .. tn_style

function Recolor(color)
	vim.cmd.colorscheme(color or def_color)
end

return {
	'folke/tokyonight.nvim',

	config = function()
		require 'tokyonight'.setup({
			style = tn_style,
			terminal_colors = true,
		})

		Recolor()
	end
}

