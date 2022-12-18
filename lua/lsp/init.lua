-- lsp 配置
local lspconfig = require("lspconfig")


local handle = require("lsp.handle")


require("luasnip.loaders.from_vscode").lazy_load()
-- 启动对应语言的 lsp
local servers = {
	tsserver = require("lsp.ts"),
	sumneko_lua = require("lsp.lua"),
  cssls = require('lsp.css'),
  html = require('lsp.html'),
  emmet_ls = require('lsp.emmet'),
  jsonls = require('lsp.json'),
  rust_analyzer = require('lsp.rust'),
  volar = require('lsp.vue'),
  gopls = require('lsp.go')
}
for name, options in pairs(servers) do
	-- 启动语言服务器
	-- on_attach 成功附加到给定缓冲区后运行 lua 回调。
  --
  handle(lspconfig[name], options)
end
