require("nvim-dap-virtual-text").setup({
  enabled = true,
  enable_commands = true,
  highlight_changed_variables = true,-- 高亮更改的变量
  highlight_new_as_changed = true, -- 高亮新变量
  show_stop_reason = true, --- 显示异常停止报错
  commented  = true, --- 用注释字符串为虚拟文件添加前缀
  only_first_definition = true, --- 只在首次定义是显示虚拟文本
  all_references = false, --- 在变量的引入上显示虚拟文本
  filter_references_pattern = '<module', -- 激活 all_references 过滤模块引用
  virt_text_pos = 'eol',-- 虚拟文件位置
  all_frames = true, -- 显示所有堆栈帧的虚拟文本
  virt_lines = false, --- 显示虚拟线
  virt_text_win_col = nil, --- 虚拟文本定位在固定窗口列
})
