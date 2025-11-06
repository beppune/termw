local M = {
	BUILD = nil,
	TEST = nil,
	RUN = nil,
}

local geometry = nil

function set_geometry()
	if geometry == nil then

		local w = vim.fn.floor(vim.o.columns * 0.8)
		local h = vim.fn.floor(vim.o.lines * 0.8)

		geometry = {
			width = w,
			height = h,
			col = vim.o.columns - (w + (vim.o.columns - w) / 2),
			row = vim.o.lines - (h + (vim.o.lines - h) / 2),
		}
	end
end

local function open()
	set_geometry()
	local w = vim.api.nvim_open_win(0, true, {
		relative = 'editor',
		width = geometry.width,
		height = geometry.height,
		zindex = 300,
		border = { "╔", "═" ,"╗", "║", "╝", "═", "╚", "║" },
		title = "Command",
		fixed = true,
		row = geometry.row,
		col = geometry.col,
	})

	vim.cmd('term')

	return vim.api.nvim_win_get_buf(w)
end

local function cmd(cmd_string)
	local buf = open()
	vim.api.nvim_buf_set_keymap(buf, 't', '<Esc>', '<C-\\><C-n>', { noremap = true})
	vim.api.nvim_buf_set_keymap(buf, 'n', '<Esc>', '<C-w><C-q>', { noremap = true})
	vim.cmd('startinsert')
	local keys = vim.api.nvim_replace_termcodes('<CR>' .. cmd_string .. '<CR>', true, false, true)
	vim.api.nvim_feedkeys(keys, 'i', false)

end

function M.setup(opts)
	if opts.build ~= nil then
		M.BUILD = opts.build
	end

	if opts.run ~= nil then
		M.RUN = opts.run
	end

	if opts.test ~= nil then
		M.TEST = opts.run
	end
end

function M.run()
	if M.RUN ~= nil then
		cmd(M.RUN)
	end
end

function M.build()
	if M.BUILD ~= nil then
		cmd(M.BUILD)
	end
end

function M.test()
	if M.TEST ~= nil then
		cmd(M.TEST)
	end
end

return M
