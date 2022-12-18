local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

local nullSources = {
	-- Formatting ---------------------
	-- shfmt shell 的格式化
	--  brew install shfmt
	formatting.shfmt,
	--- rust 格式化
	formatting.rustfmt,
	-- StyLua
	formatting.stylua,
	-- typescript
	require("typescript.extensions.null-ls.code-actions"),
	-- prettier
	-- formatting.prettier.with({ -- 只比默认配置少了 markdown
	-- 	filetypes = {
	-- 		"javascript",
	-- 		"javascriptreact",
	-- 		"typescript",
	-- 		"typescriptreact",
	-- 		"vue",
	-- 		"css",
	-- 		"scss",
	-- 		"less",
	-- 		"html",
	-- 		"json",
	-- 		"yaml",
	-- 		"graphql",
	-- 	},
	-- 	prefer_local = "node_modules/.bin",
	-- })
	-- formatting.fixjson,
	-- formatting.black.with({ extra_args = { "--fast" } }),
	-- #{m}: message
	-- #{s}: source name (defaults to null-ls if not specified)
	-- #{c}: code (if available)
	-- 提示格式： [eslint] xxx
	diagnostics_format = "[#{s}] #{m}",
}

local function findFilename(name)
	local dirname = vim.fs.dirname(vim.api.nvim_buf_get_name(0))

	local find = vim.fs.find(name, {
		upward = true,
		path = dirname,
		type = "file",
	})
	return find[1]
end

local eslint_format = {

	-- Diagnostics  ---------------------
	diagnostics.eslint.with({
		prefer_local = "node_modules/.bin",
	}),
	-- code actions ---------------------
	-- code_actions.gitsigns,
	code_actions.eslint.with({
		prefer_local = "node_modules/.bin",
	}),
}

if findFilename({ ".eslintrc", ".eslintrc.js", ".eslintrc.cjs", ".eslintrc.json" }) then
	for key, value in pairs(eslint_format) do
		table.insert(nullSources, value)
	end
end

-- 绑定按键
require("keys").nullKeys()

null_ls.setup({
	debug = false,
	sources = nullSources,
	-- 保存自动格式化
	on_attach = function(client)
		--    if client.resolved_capabilities.document_formatting then
		--    vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
		-- end
	end,
})
