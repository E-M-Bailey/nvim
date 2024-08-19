-- Keybinds

vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

function Remap_general()
	-- 'Quit' - exit
	vim.keymap.set('n', '<leader>q', vim.cmd.xit)
	-- 'Quit all' - exit all
	vim.keymap.set('n', '<leader>Q', vim.cmd.xall)
	-- 'Write' - write
	vim.keymap.set('n', '<leader>w', vim.cmd.write)
	-- 'Write' - write all
	vim.keymap.set('n', '<leader>W', vim.cmd.wall)

	-- 'Project View' - file explorer
	vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)
end

function Remap_fugitive()
	-- 'Git Status' - git
	vim.keymap.set('n', '<leader>gs', vim.cmd.Git)
end

function Remap_harpoon()
	local hp = require 'harpoon'

	-- 'Harpoon Add' - add current buffer to harpoon
	vim.keymap.set('n', '<leader>ha', function()
		hp:list():add()
	end)
	-- 'Harpoon Clear' - clear harpoon
	vim.keymap.set('n', '<leader>hc', function()
		hp:list():clear()
	end)

	for i = 1, #Harpoon_names do
		local num = i
		local name = Harpoon_names:sub(i, i)

		-- 'Harpoon' - open harpooned buffer
		vim.keymap.set('n', '<leader>h' .. name, function()
			hp:list():select(num)
		end)
		-- 'Harpoon Store' - add current buffer to harpoon
		vim.keymap.set('n', '<leader>hs' .. name, function()
			hp:list():replace_at(num)
		end)
	end
end

function Remap_luasnip()
	local ls = require 'luasnip'

	vim.keymap.set('i', '<C-s>e', function() ls.expand() end)
	vim.keymap.set({'i', 's'}, '<C-s>]', function() ls.jump(1) end)
	vim.keymap.set({'i', 's'}, '<C-s>[', function() ls.jump(-1) end)
	vim.keymap.set({'i', 's'}, '<C-E>', function()
		if ls.choice_active() then
			ls.change_choice(1)
		end
	end)
end

function Remap_neotree()
	-- 'Neotree Filesystem' - focus Neotree with the filesystem
	vim.keymap.set('n', '<leader>nf', function()
		vim.cmd.Neotree('filesystem')
	end)
	-- 'Neotree Git' - focus Neotree with git
	vim.keymap.set('n', '<leader>ng', function()
		vim.cmd.Neotree('git_status')
	end)
	-- 'Neotree Buffer' - focus Neotree with buffers
	vim.keymap.set('n', '<leader>nb', function()
		vim.cmd.Neotree('buffers')
	end)
	-- 'Neotree Document symbols' - focus Neotree with document symbols
	vim.keymap.set('n', '<leader>nd', function()
		vim.cmd.Neotree('document_symbols')
	end)
	-- 'Neotree Harpoon' - focus Neotree with harpooned buffers
	vim.keymap.set('n', '<leader>nh', function()
		vim.cmd.Neotree('harpoon-buffers')
	end)

	-- 'Neotree Reveal' - focus Neotree with the most recent source
	vim.keymap.set('n', '<leader>nr', function()
		vim.cmd.Neotree('last')
	end)
	-- 'Neotree Show' - show Neotree with the most recent source but do not change focus
	vim.keymap.set('n', '<leader>ns', function()
		vim.cmd.Neotree('show', 'last')
	end)
	-- 'Neotree Close' - close Neotree
	vim.keymap.set('n', '<leader>nc', function()
		vim.cmd.Neotree('close')
	end)
end

function Remap_telescope()
	local tsb = require 'telescope.builtin'
	local tscv = require 'telescope.config'.values

	local function ts_toggle(files, title)
		local paths = {}
		for _, item in ipairs(files.items) do
			table.insert(paths, item.value)
		end

		require 'telescope.pickers'.new({}, {
			prompt_title = title,
			finder = require 'telescope.finders'.new_table({
				results = paths,
			}),
			previewer = tscv.file_previewer({}),
			sorter = tscv.generic_sorter({}),
		}):find()
	end


	-- 'Pick File' - find files
	vim.keymap.set('n', '<leader>pf', tsb.find_files)
	-- 'Pick Git' - git files
	vim.keymap.set('n', '<leader>pg', tsb.git_files)
	-- 'Pick Buffer' - find buffers
	vim.keymap.set('n', '<leader>pb', tsb.buffers)
	-- 'Project Search' - grep in files
	vim.keymap.set('n', '<leader>ps', function()
		tsb.grep_string({ search = vim.fn.input('> ') })
	end)
	-- 'Pick Harpoon' - find harpooned buffers
	vim.keymap.set('n', '<leader>ph', function()
		ts_toggle(require 'harpoon':list(), 'Harpoon')
	end)
end

function Remap_undotree()
	-- 'Undo tree' - toggle undo tree
	vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
end

function Remap()
	Remap_general()
	Remap_fugitive()
	Remap_harpoon()
	Remap_luasnip()
	Remap_neotree()
	Remap_telescope()
	Remap_undotree()
end

Remap_general()

