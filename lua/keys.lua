local M = {}

local function map(mode, nKey, oKey, opt)
	if opt == nil then
		opt = { noremap = true, silent = true }
	end
	vim.keymap.set(mode, nKey, oKey, opt)
end

------ back key --------
-- vim.g 设置全局变量
-- 映射 leader 为空格 默认时 \
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- windows 分屏快捷键
-- 在右边开分屏
map("n", "wwl", ":set splitright<CR>:vsp<CR>")
-- 在下面开分屏
map("n", "wwj", ":set splitbelow<CR>:sp<CR>")

-- 关闭当前窗口
map("n", "wc", "<C-w>c")
-- 关闭其他
map("n", "wo", "<C-w>o")

-- 窗口跳转
-- 左边窗口跳转
map("n", "wh", "<C-w>h")
-- 右边窗口跳转
map("n", "wl", "<C-w>l")
-- 下边窗口跳转
map("n", "wj", "<C-w>j")
-- 上边窗口跳转
map("n", "wk", "<C-w>k")

-- 左右窗口比例控制
map("n", "w,", ":vertical resize -5<CR>")
map("n", "w<", ":vertical resize -5<CR>")
map("n", "w.", ":vertical resize +5<CR>")
map("n", "w>", ":vertical resize +5<CR>")
map("n", "w;", ":resize -5<CR>")
map("n", "w:", ":resize -5<CR>")
map("n", "w'", ":resize +5<CR>")
map("n", 'w"', ":resize +5<CR>")

------ 方向
map("n", "J", "5j")
map("n", "K", "5k")
map("n", "H", "5h")
map("n", "L", "5l")

map({ "n", "i", "c" }, "<A-y>", "<left>")
map({ "n", "i", "c" }, "<A-u>", "<down>")
map({ "n", "i", "c" }, "<A-i>", "<up>")
map({ "n", "i", "c" }, "<A-o>", "<right>")

map("n", "d.", "d$")
map("n", "d,", "d^")
map("n", "d>", "d$")
map("n", "d<", "d^")

map("n", "y.", "y$")
map("n", "y,", "y^")
map("n", "y>", "y$")
map("n", "y<", "y^")

-- 查看配置
--
map("n", "<leader>mk", ":set splitright<CR>:vsplit ~/.config/nvim/README.md<CR>")

------------------------  lsp  --------------------------------------
------------------------  lsp  --------------------------------------
------------------------  lsp  --------------------------------------
------------------------  lsp  --------------------------------------

function M.cmpKeys(cmp, luasnip)
	return {
		-- 出现补全
		["<A-.>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		-- 取消
		["<A-,>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}, { "i", "c" }),
		-- -- 上一个
		["<A-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
		-- -- 下一个
		["<A-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
		-- 确认
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = false,
		}),
		-- 如果窗口内容太多，可以滚动
		["<A-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
		["<A-n>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
	}
end

----------------- lspsaga --------------------

function M.lspSagaKeys()
	--显示变量使用定义引用位置
	map("n", "gh", "<cmd>Lspsaga lsp_finder<CR>")

	-- 代码诊断修复
	map({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>")

	-- 重命名
	map("n", "gr", "<cmd>Lspsaga rename<CR>")

	-- 开启一个浮动窗口显示当前变量方法定义位置
	map("n", "gd", "<cmd>Lspsaga peek_definition<CR>")
	-- 代码出现问题位置查询
	map("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>")
	map("n", "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>")

	-- 出错位置跳转
	map("n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
	map("n", "gj", "<cmd>Lspsaga diagnostic_jump_next<CR>")
	map("n", "[E", function()
		require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
	end)
	map("n", "]E", function()
		require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
	end)

	-- Outline
	map("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", { silent = true })

	-- 类型查询
	map("n", "gt", "<cmd>Lspsaga hover_doc<CR>")

	--- lsp_finder key ---
	return {
		finderKey = {
			-- 在新 buffer 打开
			open = { "o", "<CR>" },
			-- 分屏打开
			vsplit = "wwl",
			split = "wwj",
			-- 新tab 打开
			-- tabe = "t",
			-- 退出
			quit = { "q", "<ESC>" },
		},
		--- lsp code action key
		codeAction = {
			-- 退出
			quit = "q",
			-- 修复
			exec = "<CR>",
		},
		peekDefinition = {

			edit = "o",
			vsplit = "wwl",
			split = "wwj",
			quit = "q",
		},
	}
end

---------------------- null ls ---------
-- 格式化代码

M.nullKeys = function()
	map({ "n", "v" }, "<leader>/", vim.lsp.buf.format)
end

------ tree ---------
M.treeKeys = function()
	map("n", "tt", ":NvimTreeToggle<CR>")
	return {
		-- 显示和隐藏 . 文件
		{ key = ".", action = "toggle_dotfiles" },
		-- 创建文件
		{ key = "a", action = "create" },
		-- 删除文件
		{ key = "d", action = "remove" },
		-- 重命名
		{ key = "r", action = "rename" },
		-- 剪切
		{ key = "x", action = "cut" },
		-- 复制
		{ key = "c", action = "copy" },
		-- 粘贴
		{ key = "p", action = "paste" },
		-- 在系统文件管理器打开
		{ key = "s", action = "system_open" },
		{ key = "o", action = "cd" },
		{ key = "h", action = "toggle_file_info" },
		{ key = "wwl", action = "vsplit" },
		{ key = "wwj", action = "split" },
	}
end

--------- telescope -----

M.telescopeKeys = function()
	map("n", "<leader>ff", ":Telescope find_files<CR>")
	map("n", "<leader>fw", ":Telescope live_grep<CR>")
	map("n", "<leader>fp", ":Telescope neoclip a<CR>")
	map("n", "<leader>fe", ":Telescope env<CR>")
	return {
		-- 上下移动
		["<A-j>"] = "move_selection_next",
		["<A-k>"] = "move_selection_previous",
		-- 历史记录
		["<A-h>"] = "cycle_history_next",
		["<A-l>"] = "cycle_history_prev",
		-- 关闭窗口
		["<A-q>"] = "close",
		-- 预览窗口上下滚动
		["<A-u>"] = "preview_scrolling_up",
		["<A-n>"] = "preview_scrolling_down",
	}
end

------- buffer ----

M.bufferKeys = function()
	map("n", "<leader>bj", ":BufferLineCycleNext<CR>")
	map("n", "<leader>bk", ":BufferLineCyclePrev<CR>")
	-- map("n", "<leader>ba", ":ball<CR>")
	map("n", "<leader>b,", ":BufferLineCloseLeft<CR>")
	map("n", "<leader>b<", ":BufferLineCloseLeft<CR>")
	map("n", "<leader>b.", ":BufferLineCloseRight<CR>")
	map("n", "<leader>b>", ":BufferLineCloseRight<CR>")
	map("n", "<leader>bc", ":bdelete<CR>")
end

M.dapKeys = function()
	-- 取消和添加断点
	map({ "n" }, "<leader>db", require("dap").toggle_breakpoint)
	--  pause = "" 暂停调试
	map({ "n" }, "<leader>dp", require("dap").pause)
	-- play = "",恢复或者开始调试或者跳到下一个断点
	map({ "n" }, "<leader>ds", require("dap").continue)
	-- step_into = "", 单步执行调试
	map({ "n" }, "<leader>dj", require("dap").step_into)
	-- step_over = "",跳到下一个函数调用
	map({ "n" }, "<leader>dl", require("dap").step_over)
	-- step_out = ""跳出当前函数
	map({ "n" }, "<leader>dk", require("dap").step_out)
	-- step_back = "",后退上一个函数
	map({ "n" }, "<leader>dh", require("dap").step_back)
	-- run_last = "", 重新调试
	map({ "n" }, "<leader>dr", require("dap").run_last)
	-- terminate = "",停止调试
	map({ "n" }, "<leader>dc", require("dap").terminate)
	-- 打开关闭 调试 界面
	map({ "n" }, "<leader>dt", require("dapui").toggle)
end

local function getCurrentBufType()
	local bufnr = vim.api.nvim_get_current_buf()
	-- local file = vim.uri_from_bufnr(bufnr)
	-- print(string.sub(file, 8))
	-- local ft =vim.filetype.match({ filename = file })
	local type = vim.filetype.match({ buf = bufnr })
	return type
	-- if type == "markdown" then
	--   vim.cmd('MarkdownPreview')
	-- end
end

local function runCode()
	local type = getCurrentBufType()
	if type == "markdown" then
		vim.cmd("MarkdownPreview")
	end
end

map({ "n" }, "r", runCode)

function M.floatermKeys()
	--新终端
	-- vim.g.floaterm_keymap_new = "<A-n>"
	-- -- 上一个终端
	-- vim.g.floaterm_keymap_prev = "<A-k>"
	-- -- 下一个终端
	-- vim.g.floaterm_keymap_next = "<A-j>"
	-- -- 显示隐藏终端
	-- vim.g.floaterm_keymap_toggle = "<A-t>"
	-- -- 第一个终端
	-- vim.g.floaterm_keymap_first = "<A-h>"
	-- -- 最后一个终端
	-- vim.g.floaterm_keymap_last = "<A-l>"

	-- -- 显示隐藏终端
  map("n", "<A-t>", ":FloatermToggle<CR>")
  map("t", "<A-t>", [[<cmd>:FloatermHide<CR>]])
	--新终端
	map("t", "<A-n>", "<cmd>:FloatermNew<CR>")
	-- -- 上一个终端
  map("t", "<A-j>", "<cmd>:FloatermNext<CR>")
	-- -- 下一个终端
  map("t", "<A-k>", "<cmd>:FloatermPrev<CR>")
	-- -- 第一个终端
  map("t", "<A-h>", "<cmd>:FloatermFirst<CR>")
	-- -- 最后一个终端
  map("t", "<A-l>", "<cmd>:FloatermLast<CR>")
end

return M
