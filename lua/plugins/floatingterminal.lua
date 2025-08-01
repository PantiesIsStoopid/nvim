local State = {
	floating = { buf = -1, win = -1 },
}

local function CreateFloatingWindow(Opts)
	Opts = Opts or {}
	local Width = Opts.width or math.floor(vim.o.columns * 0.8)
	local Height = Opts.height or math.floor(vim.o.lines * 0.8)

	local Col = math.floor((vim.o.columns - Width) / 2)
	local Row = math.floor((vim.o.lines - Height) / 2)

	local Buf
	if vim.api.nvim_buf_is_valid(Opts.buf) then
		Buf = Opts.buf
	else
		Buf = vim.api.nvim_create_buf(false, true)
	end

	local WinConfig = {
		relative = "editor",
		width = Width,
		height = Height,
		col = Col,
		row = Row,
		style = "minimal",
		border = "rounded",
	}

	local Win = vim.api.nvim_open_win(Buf, true, WinConfig)

	return { buf = Buf, win = Win }
end

local function ToggleTerminal()
	if not vim.api.nvim_win_is_valid(State.floating.win) then
		State.floating = CreateFloatingWindow({ buf = State.floating.buf })
		if vim.bo[State.floating.buf].buftype ~= "terminal" then
			vim.cmd.terminal()
		end
	else
		vim.api.nvim_win_hide(State.floating.win)
	end
end

vim.api.nvim_create_user_command("Floaterminal", ToggleTerminal, {})

return {}
