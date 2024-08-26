local theme = 'ayu_mirage'
local date_fmt = ' %a %F'
local time_fmt = '󰥔 %T'

-- Harpoon customization
local hp_indicators = {}
local hp_active_indicators = {}
for i = 1, #Harpoon_names do
	table.insert(hp_indicators, Harpoon_names:sub(i, i))
	table.insert(hp_active_indicators, '[' .. Harpoon_names:sub(i, i) .. ']')
end

-- Components
local filename = {
	'filename',
	file_status = true,
	newfile_status = true,
	path = 1,
}

return {
	{
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
	}, {
		'letieu/harpoon-lualine',
		dependencies = {
			{
				'ThePrimeagen/harpoon',
				branch = 'harpoon2',
			},
		},
	}, {
		'nvim-lualine/lualine.nvim',

		dependencies = { 'nvim-tree/nvim-web-devicons' },

		config = function()
			print('calling main lualine setup:')
			require 'lualine'.setup({
				options = {
					theme = theme,
					refresh = {
						statusline = 1000,
						tabline = 1000,
						winbar = 1000,
					},
				},
				sections = {
					lualine_a = { 'mode' },
					lualine_b = { 'branch', 'diff', 'diagnostics' },
					lualine_c = { filename },
					lualine_x = { 'encoding', 'fileformat', 'filetype' },
					lualine_y = { 'progress' },
					lualine_z = { 'location' },
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = { filename },
					lualine_x = { 'location' },
					lualine_y = {},
					lualine_z = {},
				},
				tabline = {
					lualine_a = { 'hostname' },
					lualine_b = {},
					lualine_c = {{
						'tabs',
						mode = 1,
					}},
					lualine_x = {{
						'harpoon2',
						indicators = hp_indicators,
						active_indicators = hp_active_indicators,
					}},
					lualine_y = {{
						require 'battery'.get_status_line,
					}},
					lualine_z = {
						function()
							return os.date(date_fmt)
						end,
						function()
							return os.date(time_fmt)
						end,
					},
				},
				extensions = {
					'fugitive',
					'lazy',
					'mason',
					'neo-tree',
				},
			})
		end,
	},
}
