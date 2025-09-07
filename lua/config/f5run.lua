vim.keymap.set("n", "<F5>", function()
	local Ft = vim.bo.filetype
	local File = vim.fn.expand("%:p")
	local Cmd = ""

	if Ft == "python" then
		Cmd = "python " .. File
	elseif Ft == "cpp" then
		local Exe = vim.fn.expand("%:r") .. ".exe"
		Cmd = "g++ -std=c++17 -O2 -Wall " .. File .. " -o " .. Exe .. " && " .. Exe
	elseif Ft == "c" then
		local Exe = vim.fn.expand("%:r") .. ".exe"
		Cmd = "gcc -O2 -Wall " .. File .. " -o " .. Exe .. " && " .. Exe
	elseif Ft == "rust" then
		Cmd = "cargo run"
	elseif Ft == "go" then
		Cmd = "go run " .. File
	elseif Ft == "javascript" then
		Cmd = "node " .. File
	elseif Ft == "typescript" then
		Cmd = "ts-node " .. File
	else
		print("No run command set for filetype: " .. Ft)
		return
	end

	vim.cmd("split | terminal " .. Cmd)
end, { desc = "Run code" })
