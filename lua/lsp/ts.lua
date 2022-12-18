
-- lsp 自动补全
local M = {
	filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
	root_dir = {"package.json", "tsconfig.json", "jsconfig.json", ".git"},
  __init__ =  function (server, options)
    
    require("typescript").setup({
    disable_commands = false, -- prevent the plugin from creating Vim commands
    debug = false, -- enable debug logging for commands
    go_to_source_definition = {
        fallback = true, -- fall back to standard LSP definition on failure
    },
    server = options,
  })
  end
}


return M
