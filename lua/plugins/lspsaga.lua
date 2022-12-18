local saga = require("lspsaga")

--- key map ----
-- 查找当前变量方法的调用 定义 使用
local keys = require("keys").lspSagaKeys()


saga.init_lsp_saga({
	-- "single" | "double" | "rounded" | "bold" | "plus"
	-- 边框样式
	border_style = "rounded",
	-- 背景透明程度 0 - 100 , 0 - 30 通常都可以使用。
	saga_winblend = 0,
	-- 警告报错图标
	diagnostic_header = { "😡", "😥", "😤", "😐" }, ---{ " ", " ", " ", "ﴞ " },
	max_preview_lines = 10,
	-- 可以自动修复代码提示图标
	code_action_icon = "💡",
	-- 可以使用数字选择修复代码的方式
	code_action_num_shortcut = true,
	-- same as nvim-lightbulb but async

	code_action_lightbulb = {
		enable = true,
		enable_in_insert = true,
		cache_code_action = true,
		sign = true,
		update_time = 150,
		sign_priority = 20,
		virtual_text = true,
	},
	-- 查找当前变量方法使用 引入 调用位置
	finder_icons = {
		-- 定义图标
		def = "  ",
		-- 使用图标
		ref = "諭 ",
		-- 引入图标
		link = "  ",
	},
	-- 查找最长时间
	finder_request_timeout = 1500,
	-- 查找操作
	finder_action_keys = keys.finderKey,
	-- 修复操作
	code_action_keys = keys.codeAction,
	-- 对 peek_definition 窗口操作
	-- 定义位置浮动窗口操作
	definition_action_keys = keys.peekDefinition,
	-- 退出重命名
	rename_action_quit = "<Esc>",
	rename_in_select = true,
  -- 顶部 statusline
	symbol_in_winbar = {
		in_custom = false,
		enable = true,
		separator = " ",
		show_file = true,
		-- define how to customize filename, eg: %:., %
		-- if not set, use default value `%:t`
		-- more information see `vim.fn.expand` or `expand`
		-- ## only valid after set `show_file = true`
		file_formatter = "",
		click_support = false,
	},
	-- 代码树状视图配置
	show_outline = {
		win_position = "right",
		win_width = 30,
		-- 定位到选中代码到 buffer 位置
		jump_key = "<CR>",
		-- buffer 改变视图自动更新
		-- auto_refresh = true,
	},
  
})
