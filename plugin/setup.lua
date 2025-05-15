
local M = nil

-- Expand this map as needed
local configs = {
	rust = {
		build = 'cargo build',
		run = 'cargo run',
	}
}

vim.api.nvim_create_autocmd('FileType', {
	pattern = '*',
	callback = function(args)
		if configs[vim.o.filetype] ~= nil then

			M = require 'termw'.setup(configs[vim.o.filetype])

			vim.keymap.set('n', '<Plug>(TermwRun)', ':lua package.loaded.termw.run()<Enter>', { noremap = true, silent = true })
			vim.keymap.set('n', '<Plug>(TermwBuild)', ':lua package.loaded.termw.build()<Enter>', { noremap = true, silent = true })
		end
	end
})

