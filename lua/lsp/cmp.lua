-- 自动补全配置
local cmp = require("cmp")

local lspkind = require("plugins.lspkind")
local luasnip = require("luasnip")

cmp.setup({
	-- 代码片段
	snippet = {
		expand = function(args)
			print("hellowww")
			print(args.body)
			luasnip.lsp_expand(args.body)
		end,
	},
	-- 图标
	formatting = {
		format = lspkind.format,
	},

	confirm_opts = {
		behavior = cmp.ConfirmBehavior.Replace,
		select = false,
	},
	-- 边框
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	-- 按键配置
	mapping = require("keys").cmpKeys(cmp),

	sources = {
		-- 代码片段来源
		{ name = "nvim_lsp" },
		-- 代码片段来源
		{ name = "luasnip" },
		-- keyword_length 输入够数量的字符才出现补全提示
		-- priority 优先级
		-- max_item_count 出现最大项片段
		{ name = "buffer" },
		{ name = "path" },
	},

	experimental = {
		-- 将第一个或者选中补全隐式显示
		ghost_text = true,
		native_menu = false,
	},
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ "/", "?" }, {
 mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})
