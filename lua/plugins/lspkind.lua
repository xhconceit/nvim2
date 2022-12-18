local lspkind = require("lspkind")
local types = require("cmp.types")
local str = require("cmp.utils.str")
lspkind.init({
	-- DEPRECATED (use mode instead): enables text annotations
	--
	-- default: true
	-- with_text = true,

	-- defines how annotations are shown
	-- default: symbol
	-- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
	mode = "symbol_text",

	-- default symbol map
	-- can be either 'default' (requires nerd-fonts font) or
	-- 'codicons' for codicon preset (requires vscode-codicons font)
	--
	-- default: 'default'
	preset = "codicons",

	-- override preset symbols
	--
	-- default: {}
	symbol_map = {
		Text = "",
		Method = "",
		Function = "",
		Constructor = "",
		Field = "ﰠ",
		Variable = "",
		Class = "ﴯ",
		Interface = "",
		Module = "",
		Property = "ﰠ",
		Unit = "塞",
		Value = "",
		Enum = "",
		Keyword = "",
		Snippet = "",
		Color = "",
		File = "",
		Reference = "",
		Folder = "",
		EnumMember = "",
		Constant = "",
		Struct = "פּ",
		Event = "",
		Operator = "",
		TypeParameter = "",
	},
})

local M = {}
M.format = lspkind.cmp_format({
	--- 'text', 'text_symbol', 'symbol_text', 'symbol'
	mode = "text", -- show only symbol annotations
	-- 最宽弹窗
	maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
	-- 当弹窗超过 maxwidth 显示符好
	ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)

	before = function(entry, vim_item)
		-- Get the full snippet (and only keep first line)
		local word = entry:get_insert_text()
    
		if entry.completion_item.insertTextFormat == types.lsp.InsertTextFormat.Snippet then
			word = vim.lsp.util.parse_snippet(word)
		end
		word = str.oneline(word)

		-- concatenates the string
		-- local max = 50
		-- if string.len(word) >= max then
		-- 	local before = string.sub(word, 1, math.floor((max - 3) / 2))
		-- 	word = before .. "..."
		-- end

		if
			entry.completion_item.insertTextFormat == types.lsp.InsertTextFormat.Snippet
			and string.sub(vim_item.abbr, -1, -1) == "~"
		then
			word = word .. "~"
		end
		vim_item.menu = "[" .. string.upper(entry.source.name) .. "]"
    local symbol = lspkind.symbolic(vim_item.kind)
		vim_item.abbr = symbol..' '..word
		return vim_item
	end,
	-- 自定义
	-- before = function(entry, vim_item)
	-- 	-- Source 显示提示来源
	--
	-- 	vim_item.menu = "[" .. string.upper(entry.source.name) .. "]"
	--    print(vim_item.menu)
	--    vim_item.addr = 'h'
	-- 	return vim_item
	-- end,
})
return M
