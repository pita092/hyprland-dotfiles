local map = vim.keymap.set
vim.keymap.set("n", "<leader>pv", ":Ex<CR>", { desc = "File Tree" })

map("n", "<C-h>", "<cmd>TmuxNavigateRight <CR>", { desc = "switch window left" })
map("n", "<C-l>", "<cmd>TmuxNavigateLeft<CR>", { desc = "switch window right" })
map("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>", { desc = "switch window down" })
map("n", "<C-k>", "<cmd>TmuxNavigateUp <CR>", { desc = "switch window up" })

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '>-2<CR>gv=gv")

map("n", "<Esc>", "<cmd>noh<CR>", { desc = "General Clear highlights" })

--map("n", "<leader>ch", "<cmd>NvCheatsheet<CR>", { desc = "Toggle nvcheatsheet" })

-- global lsp mappings
map("n", "<leader>ds", vim.diagnostic.setloclist, { desc = "LSP Diagnostic loclist" })

-- neotree/oil
map("n", "<leader>e", ":Neotree reveal right<CR>", { silent = true, desc = "neotree reavel" })
-- map("n", "<C-x>", "<CMD>Oil<CR>", { silent = true, desc = "Open parent directory" })
-- map("n", "<C-f>", ":lua require('oil').close()<CR>", { silent = true, desc = "Close oil" })

-- telescope
local builtin = require("telescope.builtin")
local themes = require("telescope.themes")
-- local open_with_trouble = require("trouble.sources.telescope").open
--
-- vim.keymap.set("i", "<C-t>", open_with_trouble, { desc = "Trouble" })
-- vim.keymap.set("n", "<C-t>", open_with_trouble, { desc = "Trouble" })
--
vim.keymap.set("n", "<leader>H", builtin.help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>K", "<CMD>Telescope themes<CR>", { desc = "[S]earch [K]eymaps" })
vim.keymap.set("n", "<leader>g", builtin.find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>o", function()
	builtin.live_grep({
		winblend = 0,
		previewer = true,
	})
end, { desc = "[O] Live grep" })
vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
vim.keymap.set("n", "<leader>p", builtin.git_files, { desc = "[G]it Files" })
vim.keymap.set("n", "<leader>th", builtin.git_commits, { desc = "[G]it Commits" })

vim.keymap.set("n", "<leader><leader>", function()
	builtin.buffers({
		winblend = 0,
		previewer = true,
	})
end, { desc = "[ ] Find existing buffers" })

vim.keymap.set("n", "<leader>/", function()
	builtin.current_buffer_fuzzy_find(themes.get_dropdown({
		winblend = 0,
		previewer = false,
	}))
end, { desc = "[/] Fuzzily search in current buffer" })

vim.keymap.set("n", "<leader>sn", function()
	builtin.find_files({ cwd = vim.fn.stdpath("config") })
end, { desc = "[S]earch [N]eovim files" })

-- terminal
map("t", "<C-x>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })

-- new terminals
map("n", "<leader>v", function()
	require("nvterm.terminal").new("horizontal")
end, { desc = "terminal new vertical window" })

vim.api.nvim_set_keymap("n", "<C-q>", ":bdelete!<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<C-q>", "<C-\\><C-n>:bdelete!<CR>", { noremap = true, silent = true })

-- whichkey
map("n", "<leader>wK", "<cmd>WhichKey <CR>", { desc = "whichkey all keymaps" })

map("n", "<leader>wk", function()
	vim.cmd("WhichKey " .. vim.fn.input("WhichKey: "))
end, { desc = "whichkey query lookup" })

-- blankline
map("n", "<leader>cc", function()
	local config = { scope = {} }
	config.scope.exclude = { language = {}, node_type = {} }
	config.scope.include = { node_type = {} }
	local node = require("ibl.scope").get(vim.api.nvim_get_current_buf(), config)

	if node then
		local start_row, _, end_row, _ = node:range()
		if start_row ~= end_row then
			vim.api.nvim_win_set_cursor(vim.api.nvim_get_current_win(), { start_row + 1, 0 })
			vim.api.nvim_feedkeys("_", "n", true)
		end
	end
end, { desc = "blankline jump to current context" })

--tabline

vim.keymap.set("n", "<C-e>", ":tabnext<CR>", { noremap = true, silent = true, desc = "next tab" })
vim.keymap.set("n", "<C-t>", ":tabclose<CR>", { noremap = true, silent = true, desc = "next tab" })
vim.keymap.set("n", "<C-q>", ":tabprevious<CR>", { noremap = true, silent = true, desc = "previous tab" })

--custom menu

-- vim.keymap.set("n", "<leader>d", function()
-- 	local dashboard_opened = require("pitavim.scripts.menu").toggle_dashboard()
-- 	if dashboard_opened then
-- 		print("Dasboard opned")
-- 	else
-- 		print("Dashboard closed")
-- 	end
-- end, { desc = "Toggle dashboard" })
--
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local sorters = require("telescope.sorters")
local conf = require("telescope.config").values

-- Custom actions
local custom_actions = {}

function custom_actions.select_language(prompt_bufnr)
	local selection = action_state.get_selected_entry()
	actions.close(prompt_bufnr)
	print("You selected: " .. selection.value)
	-- Here you can add more functionality, like opening a file or running a command
	-- based on the selected language
	if selection.value == "Python" then
		vim.cmd("edit ~/.config/nvim/ftplugin/python.lua")
	elseif selection.value == "JavaScript" then
		vim.cmd("edit ~/.config/nvim/ftplugin/javascript.lua")
	elseif selection.value == "Rust" then
		vim.cmd("!cargo new my_rust_project")
	end
end

-- Transform the custom actions
local transform_mod = require("telescope.actions.mt").transform_mod
custom_actions = transform_mod(custom_actions)

-- Create the custom picker
local function language_picker(opts)
	opts = opts or {}
	pickers
		.new(opts, {
			prompt_title = "Select a Programming Language",
			finder = finders.new_table({
				results = { "Python", "JavaScript", "Rust", "Go", "Java", "C++", "Ruby" },
				entry_maker = function(entry)
					return {
						value = entry,
						display = entry,
						ordinal = entry,
					}
				end,
			}),
			sorter = sorters.get_generic_fuzzy_sorter(),
			attach_mappings = function(prompt_bufnr, map)
				map("i", "<CR>", custom_actions.select_language)
				map("n", "<CR>", custom_actions.select_language)
				return true
			end,
		})
		:find()
end

-- Set up a keymap to open the picker
vim.api.nvim_set_keymap("n", "<leader>lp", "<cmd>lua language_picker()<CR>", { noremap = true, silent = true })

--harpoon

local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<leader>f", ui.toggle_quick_menu)
vim.keymap.set("n", "<leader>r", ui.nav_next)
vim.keymap.set("n", "<leader>q", ui.nav_next)

vim.keymap.set("n", "<leader>1", function()
	ui.nav_file(1)
end)
vim.keymap.set("n", "<leader>2", function()
	ui.nav_file(2)
end)
vim.keymap.set("n", "<leader>3", function()
	ui.nav_file(3)
end)
vim.keymap.set("n", "<leader>4", function()
	ui.nav_file(4)
end)
vim.keymap.set("n", "<leader>5", function()
	ui.nav_file(5)
end)
