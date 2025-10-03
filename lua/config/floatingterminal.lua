local state = {
	floating = {
		buf = -1,
		win = -1,
	},
}

local function create_floating_window(opts)
	opts = opts or {}
	local width = opts.width or math.floor(vim.o.columns * 0.8)
	local height = opts.height or math.floor(vim.o.lines * 0.8)

	local col = math.floor((vim.o.columns - width) / 2)
	local row = math.floor((vim.o.lines - height) / 2)

	-- Create buffer if invalid
	local buf
	if opts.buf and vim.api.nvim_buf_is_valid(opts.buf) then
		buf = opts.buf
	else
		buf = vim.api.nvim_create_buf(false, true) -- No file, scratch buffer
	end

	local win_config = {
		relative = "editor",
		width = width,
		height = height,
		col = col,
		row = row,
		style = "minimal",
		border = "rounded",
	}

	local win = vim.api.nvim_open_win(buf, true, win_config)
	vim.api.nvim_win_set_option(win, "winhl", "Normal:Normal,FloatBorder:Normal")

	return { buf = buf, win = win }
end

local function toggle_terminal()
	if not vim.api.nvim_win_is_valid(state.floating.win) then
		state.floating = create_floating_window({ buf = state.floating.buf })

		if vim.api.nvim_buf_get_option(state.floating.buf, "buftype") ~= "terminal" then
			vim.fn.termopen(vim.o.shell)
		end
	else
		vim.api.nvim_win_hide(state.floating.win)
	end
end

vim.api.nvim_create_user_command("Floaterminal", toggle_terminal, {})

vim.keymap.set("n", "<leader>ft", toggle_terminal, { desc = "Toggle [F]loating [T]erminal" })
vim.keymap.set("t", "<leader>ft", "<C-\\><C-n>:Floaterminal<CR>", { noremap = true, silent = true })
