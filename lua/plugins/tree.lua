require('nvim-web-devicons').setup()
-- 开始时禁用 tree

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- 颜色突出
vim.opt.termguicolors = true
-- OR setup with some options

-- 屏幕高度
local win_height = vim.api.nvim_win_get_height(0)
-- 屏幕宽度
local win_width = vim.api.nvim_win_get_width(0)

local default_width = 90
local default_height = 70
--
local float_height = math.floor(math.min(default_height, win_height * 0.7))
local float_width = math.floor(math.min(default_width, win_width * 0.7))
local float_row = math.floor((win_height - float_height) / 2)
local float_col = math.floor((win_width - float_width) / 2)

-- local tree
local tree = require("nvim-tree")
local api = require("nvim-tree.api")




local M = {
	sort_by = "case_sensitive",
	view = {
		adaptive_size = true,
		width = float_width,
		float = {
			enable = true,
			open_win_config = {
				relative = "win",
				border = "rounded",
				width = float_width,
				height = float_height,
				row = float_row,
				col = float_col,
			},
		},
		mappings = {
			list = require("keys").treeKeys(),
		},
	},
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = true,
	},
	actions = {
		open_file = {
			-- 首次打开大小适配
			resize_window = true,
			-- 打开文件时关闭
			quit_on_open = true,
		},
	},
  git = {
    ignore = false
  }
}

tree.setup(M)
