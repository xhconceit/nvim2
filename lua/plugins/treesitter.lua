
require("nvim-treesitter.configs").setup({
	-- 启用增量选择模块
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<CR>",
			node_incremental = "<CR>",
			node_decremental = "<BS>",
			scope_incremental = "<TAB>",
		},
	},
  -- 注释插件
  context_commentstring = {
    enable = true,
    
    enable_autocmd = false,
  },
	-- 启动代码缩进 =
  -- 
	indent = {
		enable = true,
	},
	-- A list of parser names, or "all"
	--
  ensure_installed = {"css", "lua", "javascript", "typescript", "vue", "html", "markdown" },

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,

	-- Automatically install missing parsers when entering buffer
	-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	auto_install = true,

	-- List of parsers to ignore installing (for "all")
	ignore_install = { "javascript" },

	---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
	-- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

	highlight = {
		enable = true,
		-- 关闭代码高亮的语言
		--disable = { "lua", "rust" },
		-- 超过 100 kb 不高亮
		disable = function(lang, buf)
			local max_filesize = 100 * 1024 -- 100 KB
			local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
			if ok and stats and stats.size > max_filesize then
				return true
			end
		end,
		additional_vim_regex_highlighting = false,
	},
})

require'treesitter-context'.setup{
    enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
    max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
    trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
    min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
    patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
        -- For all filetypes
        -- Note that setting an entry here replaces all other patterns for this entry.
        -- By setting the 'default' entry below, you can control which nodes you want to
        -- appear in the context window.
        default = {
            'class',
            'function',
            'method',
            'for',
            'while',
            'if',
            'switch',
            'case',
        },
        -- Patterns for specific filetypes
        -- If a pattern is missing, *open a PR* so everyone can benefit.
        tex = {
            'chapter',
            'section',
            'subsection',
            'subsubsection',
        },
        rust = {
            'impl_item',
            'struct',
            'enum',
        },
        scala = {
            'object_definition',
        },
        vhdl = {
            'process_statement',
            'architecture_body',
            'entity_declaration',
        },
        markdown = {
            'section',
        },
        elixir = {
            'anonymous_function',
            'arguments',
            'block',
            'do_block',
            'list',
            'map',
            'tuple',
            'quoted_content',
        },
        json = {
            'pair',
        },
        yaml = {
            'block_mapping_pair',
        },
    },
    exact_patterns = {
        -- Example for a specific filetype with Lua patterns
        -- Treat patterns.rust as a Lua pattern (i.e "^impl_item$" will
        -- exactly match "impl_item" only)
        -- rust = true,
    },

    -- [!] The options below are exposed but shouldn't require your attention,
    --     you can safely ignore them.

    zindex = 20, -- The Z-index of the context window
    mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
    -- Separator between context and content. Should be a single character string, like '-'.
    -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
    separator = nil,
}



------------------------ html 高亮 -------------


local hl = function(group, opts)
    opts.default = true
    vim.api.nvim_set_hl(0, group, opts)
end

-- Misc {{{
hl('@comment', {link = 'Comment'})
-- hl('@error', {link = 'Error'})
hl('@none', {bg = 'NONE', fg = 'NONE'})
hl('@preproc', {link = 'PreProc'})
hl('@define', {link = 'Define'})
hl('@operator', {link = 'Operator'})
-- }}}

-- Punctuation {{{
hl('@punctuation.delimiter', {link = 'Delimiter'})
hl('@punctuation.bracket', {link = 'Delimiter'})
hl('@punctuation.special', {link = 'Delimiter'})
-- }}}

-- Literals {{{
hl('@string', {link = 'String'})
hl('@string.regex', {link = 'String'})
hl('@string.escape', {link = 'SpecialChar'})
hl('@string.special', {link = 'SpecialChar'})

hl('@character', {link = 'Character'})
hl('@character.special', {link = 'SpecialChar'})

hl('@boolean', {link = 'Boolean'})
hl('@number', {link = 'Number'})
hl('@float', {link = 'Float'})
-- }}}

-- Functions {{{
hl('@function', {link = 'Function'})
hl('@function.call', {link = 'Function'})
hl('@function.builtin', {link = 'Special'})
hl('@function.macro', {link = 'Macro'})

hl('@method', {link = 'Function'})
hl('@method.call', {link = 'Function'})

hl('@constructor', {link = 'Special'})
hl('@parameter', {link = 'Identifier'})
-- }}}

-- Keywords {{{
hl('@keyword', {link = 'Keyword'})
hl('@keyword.function', {link = 'Keyword'})
hl('@keyword.operator', {link = 'Keyword'})
hl('@keyword.return', {link = 'Keyword'})

hl('@conditional', {link = 'Conditional'})
hl('@repeat', {link = 'Repeat'})
hl('@debug', {link = 'Debug'})
hl('@label', {link = 'Label'})
hl('@include', {link = 'Include'})
hl('@exception', {link = 'Exception'})
-- }}}

-- Types {{{
hl('@type', {link = 'Type'})
hl('@type.builtin', {link = 'Type'})
hl('@type.qualifier', {link = 'Type'})
hl('@type.definition', {link = 'Typedef'})

hl('@storageclass', {link = 'StorageClass'})
hl('@attribute', {link = 'PreProc'})
hl('@field', {link = 'Identifier'})
hl('@property', {link = 'Identifier'})
-- }}}

-- Identifiers {{{
hl('@variable', {link = 'Normal'})
hl('@variable.builtin', {link = 'Special'})

hl('@constant', {link = 'Constant'})
hl('@constant.builtin', {link = 'Special'})
hl('@constant.macro', {link = 'Define'})

hl('@namespace', {link = 'Include'})
hl('@symbol', {link = 'Identifier'})
-- }}}

-- Text {{{
hl('@text', {link = 'Normal'})
hl('@text.strong', {bold = true})
hl('@text.emphasis', {italic = true})
hl('@text.underline', {underline = true})
hl('@text.strike', {strikethrough = true})
hl('@text.title', {link = 'Title'})
hl('@text.literal', {link = 'String'})
hl('@text.uri', {link = 'Underlined'})
hl('@text.math', {link = 'Special'})
hl('@text.environment', {link = 'Macro'})
hl('@text.environment.name', {link = 'Type'})
hl('@text.reference', {link = 'Constant'})

hl('@text.todo', {link = 'Todo'})
hl('@text.note', {link = 'SpecialComment'})
hl('@text.warning', {link = 'WarningMsg'})
hl('@text.danger', {link = 'ErrorMsg'})
-- }}}

-- Tags {{{
hl('@tag', {link = 'Tag'})
hl('@tag.attribute', {link = 'Identifier'})
hl('@tag.delimiter', {link = 'Delimiter'})
-- }}}
