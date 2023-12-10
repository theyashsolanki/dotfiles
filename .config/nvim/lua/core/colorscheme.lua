local M = {}

M.theme = "tokyonight"
M.transparent = true

function M.toggle_transparency()
	M.transparent = not M.transparent
	print("Transparency toggled. New state: " .. tostring(M.transparent))

	-- Reload the module "solarized-osaka.nvim" if necessary
	local success, error_message = pcall(function()
		require("lazy.core.loader").reload(M.theme .. ".nvim")
	end)

	if not success then
		print("Error reloading module: " .. error_message)
	end
end

if M.transparent then
	M.style = "transparent"
end

return M
