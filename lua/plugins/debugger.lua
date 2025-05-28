return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"leoluz/nvim-dap-go",
		"mfussenegger/nvim-dap-python",
		"theHamsta/nvim-dap-virtual-text",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")
		require("dapui").setup()
		require("nvim-dap-virtual-text").setup()

		-- Auto open/close dapui
		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		-- Keymaps
		vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
		vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Continue" })
		vim.keymap.set("n", "<leader>ds", dap.step_over, { desc = "Step Over" })

		-- Go
		require("dap-go").setup({
			delve = {
				path = "dlv",
				initialize_timeout_sec = 20,
				port = "${port}",
				build_flags = {},
				detached = vim.fn.has("win32") == 0,
			},
		})

		-- Python
		require("dap-python").setup("python") -- or full path to python.exe

		-- C, C++, Rust (lldb)
		dap.adapters.lldb = {
			type = "executable",
			command = "lldb-vscode", -- Install via `lldb` package
			name = "lldb",
		}

		dap.configurations.cpp = {
			{
				name = "Launch C++",
				type = "lldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to exe: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
				args = {},
			},
		}
		dap.configurations.c = dap.configurations.cpp
		dap.configurations.rust = dap.configurations.cpp

		-- JavaScript (Node.js)
		dap.adapters.node2 = {
			type = "executable",
			command = "node",
			args = { vim.fn.stdpath("data") .. "/dap_adapters/vscode-node-debug2/out/src/nodeDebug.js" },
		}

		dap.configurations.javascript = {
			{
				name = "Launch Node",
				type = "node2",
				request = "launch",
				program = "${file}",
				cwd = vim.fn.getcwd(),
				sourceMaps = true,
				protocol = "inspector",
				console = "integratedTerminal",
			},
		}
	end,
}
