local dap = require("dap")
dap.adapters["pwa-node"] = {
	type = "server",
	host = "localhost",
	port = "${port}",
	executable = {
		command = "node",
		-- 💀 Make sure to update this path to point to your installation
		args = { "/home/yash/.config/js-debug/src/dapDebugServer.js", "${port}" },
	},
}

local config = {
	{
		type = "pwa-node",
		request = "launch",
		name = "Launch file",
		runtimeExecutable = "deno",
		runtimeArgs = {
			"run",
			"--inspect-wait",
			"--allow-all",
		},
		program = "${file}",
		cwd = "${workspaceFolder}",
		attachSimplePort = 9229,
	},
}

return config
