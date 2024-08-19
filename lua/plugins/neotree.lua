local sources = {
	'filesystem',
	'buffers',
	'git_status',
	'document_symbols',
	'harpoon-buffers',
}
local selector_sources = {
	'filesystem',
	'buffers',
	'git_status',
	'document_symbols',
}
local selector_sources_full = {}
for _,source in ipairs(selector_sources) do
	table.insert(selector_sources_full, {source = source})
end

return {
	'nvim-neo-tree/neo-tree.nvim',

	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-tree/nvim-web-devicons',
		'MunifTanjim/nui.nvim',
		'jackielii/neo-tree-harpoon.nvim',
	},

	config = function()
		require 'neo-tree'.setup({
			filesystem = {
				filtered_items = {
					visible = true,
					hide_dotfiles = false,
					hide_gitignored = true,
				},
			},
			source_selector = {
				winbar = true,
				statusline = true,
				sources = selector_sources_full,
			},
			sources = sources,
		})

		Remap_neotree()
	end
}
