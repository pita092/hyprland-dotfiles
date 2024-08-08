require("neo-tree").setup({
close_if_last_window = false,
popup_border_style = "rounded",
enable_git_status = true,
enable_diagnostics = true,
follow_current_file = {
		enable = false,
		leave_dirs_open = false,
	},
use_libuv_file_watcher=true,
})
