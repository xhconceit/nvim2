---- 浮动窗口快捷键
-- --新终端
-- vim.g.floaterm_keymap_new = "<A-n>"
-- -- 上一个终端
-- vim.g.floaterm_keymap_prev = "<A-k>"
-- -- 下一个终端
-- vim.g.floaterm_keymap_next = "<A-j>"
-- -- 显示隐藏终端
-- vim.g.floaterm_keymap_toggle = "<A-t>"
-- -- 第一个终端
-- vim.g.floaterm_keymap_first = "<A-h>"
-- -- 最后一个终端
-- vim.g.floaterm_keymap_last = "<A-l>"
require('keys').floatermKeys()
vim.g.floaterm_borderchars = "─│─│╭╮╯╰"
vim.g.floaterm_title = "$1/$2"
