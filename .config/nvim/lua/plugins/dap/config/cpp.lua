local dap = require("dap")
dap.adapters.lldb = {
	type = "executable",
	command = "/usr/bin/lldb-vscode", -- adjust as needed, must be absolute path
	name = "lldb",
}

local config = {
	{
		name = "Launch",
		type = "lldb",
		request = "launch",
		program = "${workspaceFolder}/a.out",
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		args = {},
	},
}

return config
