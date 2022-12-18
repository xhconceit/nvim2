-- require("comment").setup({
-- 	---Add a space b/w comment and the line
-- 	padding = true,
-- 	---Whether the cursor should stay at its position
-- 	sticky = true,
-- 	---Lines to be ignored while (un)comment
-- 	ignore = nil,
-- 	--- n 模式下的 切换注释
-- 	toggler = {
-- 		--- 使用单行注释的注释符
-- 		line = "<leader>//",
-- 		--- 使用多行注释的注释符
-- 		block = "<leader>b/",
-- 	},
-- 	-- n v 模式下的注释
-- 	opleader = {
-- 		--- 单行注释
-- 		line = "<leader>/",
-- 		--- 多行注释
-- 		block = "<leader>b",
-- 	},
-- 	extra = {
-- 		--- 在当前行上一行添加注释
-- 		above = "<leader>/k",
-- 		-- 在当前行下一行添加注释
-- 		below = "<leader>/j",
-- 		--- 在当前行最后添加注释
-- 		eol = "<leader>/l",
-- 	},
--   mappings = {
-- 		--- 打开注释映射
--     -- <leader>/w 注释当前单词
--     -- <leader>/$ 从当前位置注释到行尾
--     -- <leader>/^ 从当前位置注释到行首
--     -- <leader>/{ 从当前行向上注释到一个没有任何字符行
--     -- <leader>/} 从当前行向下注释到一个没有任何字符行
--     -- <leader>a{ 注释大括号内的代码
--     -- <leader>ip 注释段落，当前行向上一个没有字符的行到向下一个没有字符的行
--     -- <leader>/2} 从当前行向下注释到2个没有任何字符行,数量可以自定义
--     -- <leader>/2{ 从当前行向上注释到2个没有任何字符行,数量可以自定义
--     -- 
-- 		basic = true,
-- 		--- 打开 extra 的映射
-- 		extra = true,
-- 	},
-- })

local opts = {
    ---Add a space b/w comment and the line
    padding = true,
    ---Whether the cursor should stay at its position
    sticky = false,
    ---Lines to be ignored while (un)comment
    ignore = nil,
    ---LHS of toggle mappings in NORMAL mode
    toggler = {
        ---Line-comment toggle keymap
        line = 'gcc',
        ---Block-comment toggle keymap
        block = 'gbc',
    },
    ---LHS of operator-pending mappings in NORMAL and VISUAL mode
    opleader = {
        ---Line-comment keymap
        line = 'gc',
        ---Block-comment keymap
        block = 'gb',
    },
    ---LHS of extra mappings
    extra = {
        ---Add comment on the line above
        above = 'gcO',
        ---Add comment on the line below
        below = 'gco',
        ---Add comment at the end of line
        eol = 'gcA',
    },
    ---Enable keybindings
    ---NOTE: If given `false` then the plugin won't create any mappings
    mappings = {
        ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
        basic = true,
        ---Extra mapping; `gco`, `gcO`, `gcA`
        extra = true,
    },
    ---Function to call before (un)comment
   pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
    -- pre_hook = nil,
    ---Function to call after (un)comment
    post_hook = nil,
}

require('Comment').setup(opts)

