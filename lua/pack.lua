-- 引入 packer 模块pack
-- 执行 packer 中的 startup 方法
-- 只有运行 PackerSync 才执行 startup 里面的回调
require("packer").startup(function(use)
	-- 插件管理器
	use("wbthomason/packer.nvim")

	------------------------- ui ------------------------------------------------
	-- 主题theme
	use({
		"glepnir/zephyr-nvim",
	})

	-- 顶部状态栏
	use({
		"akinsho/bufferline.nvim",
		tag = "v3.*",
	})
	-- 图标
	use({
		"nvim-tree/nvim-web-devicons",
	})

	-- 块代码竖线
	use("lukas-reineke/indent-blankline.nvim")
	-- 主题配置
	require("plugins.ui")

	-- 不活动代码变暗
	use({
		"folke/twilight.nvim",
	})
	-- require('plugins/twilight')

	-- lsp 进度 ui
	use({
		"j-hui/fidget.nvim",
	})
	-- 底部状态栏
	use({
		"nvim-lualine/lualine.nvim",
	})

	---------------------------------------------------------------------

	----------------------------- 自动补全

	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"onsails/lspkind.nvim",
			"hrsh7th/cmp-buffer", -- buffer 单词补全
			"hrsh7th/cmp-path", -- 路径补全
			"hrsh7th/cmp-cmdline", -- 命令补全
		},
	})
	use({
		"neovim/nvim-lspconfig", -- lsp 配置
		requires = {
			"hrsh7th/cmp-nvim-lsp", --自动补全 lsp 数据源
			{
				-- lsp 精美 ui
				"glepnir/lspsaga.nvim",
				branch = "main",
				requires = {
					{ "fgheng/winbar.nvim" },
				},
			},
			-- 使用虚拟行呈现 lsp 代码诊断
			{
				"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
				config = function()
					require("lsp_lines").setup()
				end,
			},
		},
	})
	-- lsp ui
	require("plugins.lspsaga")

	--- 代码片段
	use({
		"L3MON4D3/LuaSnip", -- 代码片段
		requires = {
			{ "L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*" }, -- 自动补全代码片段数据源
			"rafamadriz/friendly-snippets",
		},
	})
	-- 自动补全括号 自动添加闭合括号
	use({
		"windwp/nvim-autopairs",
	})
	require("plugins.autopairs")

	------------------------------------------------------

	-- 代码语法树
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		requires = {
			-- 顶部显示当前函数上下文
			"nvim-treesitter/nvim-treesitter-context",
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
	})
	require("plugins.treesitter")

	-- 文件搜索
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		-- or                            , branch = '0.1.x',
		requires = {
			-- 预览 图片 视频 字体
			{
				"nvim-telescope/telescope-media-files.nvim",
				requires = {
					{ "nvim-lua/plenary.nvim" },
					{ "nvim-lua/popup.nvim" },
				},
			},
			-- 剪贴板管理器
			{
				"AckslD/nvim-neoclip.lua",
				requires = { "kkharji/sqlite.lua" },
			},
			-- 环境变量搜索
			{
				"LinArcX/telescope-env.nvim",
			},
		},
	})
	-- 文件搜索
	require("plugins.telescope")
	-- 剪贴板管理器
	require("plugins.neoclip")

	-- 代码格式
	use({ "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" })
	require("plugins.null-ls")

	-- 文件管理器
	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			-- 文件图标
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
			-- 注释插件
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		tag = "nightly", -- optional, updated every week. (see issue #1193)
	})
	-- 文件管理器配置
	require("plugins.tree")

	-- 注释插件 注释代码
	use({
		"numToStr/Comment.nvim",
	})
	require("plugins.comment")

	-- JSON 增强 语法提示
	use("b0o/schemastore.nvim")

	-- Rust 增强
	use("simrat39/rust-tools.nvim")

	-- 调试
	use({
		"mfussenegger/nvim-dap",
		requires = {
			-- 调试虚拟文本
			{ "theHamsta/nvim-dap-virtual-text" },
			-- 调试窗口
			{ "rcarriga/nvim-dap-ui" },
		},
	})
	require("plugins.dap.init")

	-- 添加和去除环绕的括号
	use({
		'kylechui/nvim-surround',
		tag = "*", -- Use for stability; omit to use `main` branch for the latest features
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	})
	use({
		"jose-elias-alvarez/typescript.nvim",
	})

	-- markdown
	use({
		"davidgranstrom/nvim-markdown-preview",
	})
	require("plugins.markdown")

	---- git ------
	use({
		"lewis6991/gitsigns.nvim",
		-- tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
	})
	require("plugins.git")

	-- 浮动终端
	use("voldikss/vim-floaterm")
	--- 浮动终端
	require("plugins.floaterm")

	-- 透明背景
	use("xiyaowong/nvim-transparent")
	-- require('plugins.transparent')
end)
