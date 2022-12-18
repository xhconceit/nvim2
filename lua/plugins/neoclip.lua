require("neoclip").setup({
  -- 存储最多数据
  history = 1000,
	enable_persistent_history = true,
  -- 存储最长字符
	length_limit = 1048576,
	continuous_sync = false,
  --- 存储位置
	db_path = vim.fn.stdpath("data") .. "/databases/neoclip.sqlite3",
  -- 预览内容
	preview = true,

	default_register = '"',
	default_register_macros = "q",
	enable_macro_history = true,
	content_spec_column = false,

	on_paste = {
		set_reg = true,
	},
	on_replay = {
		set_reg = false,
	},
	keys = {
		telescope = {
			i = {

				paste = "<cr>",
				delete = "<A-d>", -- delete an entry
			},
			n = {
				paste = "<cr>",
				delete = "<A-d>", -- delete an entry
			},
		},
	},
})
