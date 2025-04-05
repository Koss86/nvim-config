return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
	},
	config = function()
		local dap, dapui = require("dap"), require("dapui")
		vim.keymap.set("n", "<leader>6", dap.continue, {})
		vim.keymap.set("n", "<leader>7", dap.step_over, {})
		vim.keymap.set("n", "<leader>8", dap.step_into, {})
		vim.keymap.set("n", "<leader>9", dap.step_out, {})
		vim.keymap.set("n", "<Leader>b", dap.toggle_breakpoint, {})
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
	end,
}
