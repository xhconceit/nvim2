-- settings
--
--capabilities
-- root_dir
-- filetypes
-- on_attach
-- single_file_support
--
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
local root_pattern = require("lspconfig.util").root_pattern

local function default_attach(client, bufnr)
	-- 绑定按键
	require("keys").lspSagaKeys()
	-- 禁用格式化功能，交给专门插件插件处理
	client.server_capabilities.document_formatting = false
	client.server_capabilities.document_range_formatting = false
end

local function resetOption(opt)
	local default_options = {

		capabilities = capabilities,
		on_attach = default_attach,
	}
	if opt ~= nil then
		for key, value in pairs(opt) do
			if key == "capabilities" then
				opt[key](default_options.capabilities)
			elseif key == "filetypes" then
				default_options[key] = opt[key]
			elseif key == "root_dir" then
				default_options[key] = root_pattern(opt[key])
			elseif key == "on_attach" then
				default_options[key] = function(client, bufnr)
					default_attach(client, bufnr)
					opt[key](client, bufnr)
				end
			elseif true then
				default_options[key] = opt[key]
			end
		end
	end
	return default_options
end

return function(server, opt)
  local init = opt ~= nil and opt["__init__"] ~= nil and opt['__init__'] or nil
  opt['__init__'] = nil
  opt = resetOption(opt)
	if init ~= nil then
    init(server, opt)
	else
    server.setup(opt)
	end
end
