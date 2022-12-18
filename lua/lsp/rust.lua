return {
  root_dir = {"Cargo.toml", "rust-project.json"},
  filetypes = {"rust"},
  
  __init__ = function (server, options)
     -- Initialize the LSP via rust-tools instead
    require("rust-tools").setup({
      -- The "server" property provided in rust-tools setup function are the
      -- settings rust-tools will provide to lspconfig during init.
      -- We merge the necessary settings from nvim-lsp-installer (server:get_default_options())
      -- with the user's own settings (opts).
      server = options
    })
  end
}
