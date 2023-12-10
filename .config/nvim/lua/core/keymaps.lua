-- general keymaps
vim.keymap.set("n", "x", '"_x')
vim.keymap.set("v", "D", '"_d')
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("i", "<C-h>", "<Left>")
vim.keymap.set("i", "<C-l>", "<Right>")
vim.keymap.set("i", "<C-j>", "<Down>")
vim.keymap.set("i", "<C-k>", "<Up>")
vim.keymap.set("n", "n", "")
vim.keymap.set("n", "<ESC>", ":nohl<CR>")
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
vim.api.nvim_set_keymap("n", "<leader>vm", [[:lua OpenImageWithFeh()<CR>]], { noremap = true, silent = true })

function OpenImageWithFeh()
	local image_path = vim.fn.expand("<cfile>")
	if vim.fn.filereadable(image_path) == 1 then
		vim.fn.system("feh " .. vim.fn.shellescape(image_path))
	else
		print("Not a valid image path: " .. image_path)
	end
end

vim.keymap.set("n", "<leader>tt", require("core.colorscheme").toggle_transparency)

-- compile c/c++
vim.keymap.set("n", "<leader>c+", function()
	local current_file = tostring(vim.fn.expand("%"))
	if string.match(current_file, "%.cpp$") or string.match(current_file, "%.cxx$") then
		vim.cmd("!g++ --debug %")
	end
	if string.match(current_file, "%.c$") then
		vim.cmd("!gcc --debug %")
	end
end)

-- auto format
vim.keymap.set({ "n", "v" }, "<leader>fm", function()
	require("conform").format()
end)

-- file explorer
vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>")

-- dap
vim.keymap.set("n", "<leader>db", ":DapToggleBreakpoint<CR>")
vim.keymap.set("n", "<leader>dr", ":DapContinue<CR>")

-- lsp keymaps
vim.keymap.set("n", "K", ":Lspsaga hover_doc<CR>")
vim.keymap.set("n", "gD", " :Lspsaga peek_definition<CR>")
vim.keymap.set("n", "<leader>ra", ":Lspsaga rename<CR>")
vim.keymap.set("n", "<leader>d", ":Lspsaga show_line_diagnostics<CR>")
vim.keymap.set("n", "<leader>D", ":Lspsaga show_cursor_diagnostics<CR>")
vim.keymap.set("n", "<leader>[d", ":Lspsaga diagnostic_jump_prev<CR>")
vim.keymap.set("n", "<leader>]d", ":Lspsaga diagnostic_jump_next<CR>")
vim.keymap.set("n", "<leader>pr", ":Lspsaga rename ++project<CR>")
vim.keymap.set("n", "<leader>ic", ":Telescope lsp_incoming_calls<CR>")
vim.keymap.set("n", "<leader>oc", ":Telescope lsp_outgoing_calls<CR>")

-- git signs
local gs = package.loaded.gitsigns
vim.keymap.set("n", "]c", function()
	if vim.wo.diff then
		return "]c"
	end
	vim.schedule(function()
		gs.next_hunk()
	end)
	return "<Ignore>"
end, { expr = true })

vim.keymap.set("n", "[c", function()
	if vim.wo.diff then
		return "[c"
	end
	vim.schedule(function()
		gs.prev_hunk()
	end)
	return "<Ignore>"
end, { expr = true })

-- Actions
vim.keymap.set("n", "<leader>sh", gs.stage_hunk)
vim.keymap.set("n", "<leader>rh", gs.reset_hunk)
vim.keymap.set("v", "<leader>sh", function()
	gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
end)
vim.keymap.set("v", "<leader>rh", function()
	gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
end)
vim.keymap.set("n", "<leader>hu", gs.undo_stage_hunk)
vim.keymap.set("n", "<leader>grb", gs.reset_buffer)
vim.keymap.set("n", "<leader>hp", gs.preview_hunk)
vim.keymap.set("n", "<leader>gb", ":Gitsigns blame_line<CR>")
vim.keymap.set("n", "<leader>hd", gs.diffthis)
vim.keymap.set("n", "<leader>td", gs.toggle_deleted)
-- Text object
vim.keymap.set("n", "vah", ":<C-U>Gitsigns select_hunk<CR>")
