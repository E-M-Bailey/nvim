require 'config.set'
require 'config.remap'

-- Bootstrap lazy.nvim

local path = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(path) then
	local repo = 'https://github.com/folke/lazy.nvim.git'
	local out = vim.fn.system({ 'git', 'clone', '--filter=blob:none', '--branch=stable', repo, path })

	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
			{ out, 'WarningMsg' },
			{ '\nPress any key to exit...' },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end

vim.opt.rtp:prepend(path)

require 'lazy'.setup({
	-- plugins:
	spec = {
		{ import = 'plugins' },
	},
	-- other settings:
	install = {
		colorscheme = { 'habamax' },
	},
	-- Check for updates automatically
	checker = {
		enabled = true,
	},
})

-- set register (default "') to list of installed plugins for README
GetPlugins = function(reg)
	local lines = {}
	for _,plugin in ipairs(require 'lazy'.plugins()) do
		table.insert(lines, ' - [' .. plugin.name .. '](' .. plugin.url .. ')')
	end
	table.sort(lines)
	local str=table.concat(lines, '\n')
	if reg == nil then
		reg = '"'
	end
	vim.fn.setreg(reg, str)
end

