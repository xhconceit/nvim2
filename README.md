false
通过 vim.o[configNumber] 配置基础

number 是否显示行号
tabstop tap 是几个空格组成
shiftwidth 自动缩进使用几个空格
expandtab 插入模式下的tab 使用几个空格表示




packer 命令

PackerSync  更改 packer 配置的时候必须影响 Packer 更新加载配置

PackerCompile 重新生成已编译的加载程序文件

PackerClean 删除没有使用到的插件

PackerInstall 安装插件

PackerUpdate 更新插件

PackerLoad 立即加载选择的插件

hello



## Keys


窗口按键

模式| 按键 | 描述|
----|---|---|
`n`|wwl|在右边👉分出一个新窗口|
`n`|wwj|在左边👈分出一个新窗口|
`n`|wc|改变当前窗口|
`n`|wo|改变其他窗口|
`n`|wh|到左边👈窗口编辑|
`n`|wl|到右边👉窗口编辑｜
`n`|wj|到下边👇窗口编辑|
`n`|wk|到上边👆窗口编辑|
`n`|w`,|<`|左边边框向左边👈移动|
`n`|w`.|>`|右边边框向右边👉移动|
`n`|w`;|:`|上边边框向上边👆移动|
`n`|w`'|"`|下班边框向下边👇移动|


### 光标移动


模式|按键|描述|
---|---|---|
`n`|J|光标向下👇移动5行|
`n`|K|光标向上👆移动5行|
`n`|H|光标向左👈移动5字符|
`n`|L|光标向右👉移动5字符|
`n|i|c`|\<A-u\>|光标向下👇移动1行|
`n|i|c`|\<A-i\>|光标向上👆移动1行|
`n|i|c`|\<A-y\>|光标向左👈移动1字符|
`n|i|c`|\<A-o\>|光标向右👉移动1字符|



模式|按键|描述|
---|---|---|
`n`|d`.|>`|剪切当前字符到行尾|
`n`|d`,|<`|剪切当前字符到行首|
`n`|y`.|>`|复制当前字符到行尾|
`n`|y`,|<`|复制当前字符到行首|


模式|按键|描述|
---|---|--|
`n`|\<space\>d|查看编辑 nvim README.md|


模式|按键|描述|
---|--|--|
`n`|\<A-.\>|打开补全|
`n`|\<A-,\>|关闭补全|
`n`|\<A-j\>|选择下一个补全|
`n`|\<A-k\>|选择上一个补全|
`n`|\<CR\>|选择补全|
`n`|\<A-u\>|预览窗口向上滚动|
`n`|\<A-n\>|预览窗口向下滚动|


模式|按键|描述|
---|---|---|
`n`|gh|当前方法变量引入 使用 定义位置查询|
`n``v`|\<leader\>ca| 代码修复
`n`|gr|重命名
`n`|gd|在浮动窗口显示变量方法定义位置
`n`|\<leader\>cd|报错信息显示|
`n`|gk|上一个报错
`n`|gj|下一个报错
`n`|[E|上一个报错
`n`|]E|下一个报错
`n`|\<loader\>o|显示和隐藏代码树
`n`|gt|显示类型描述|
`j``t`|\<A-t\>|显示隐藏终端|


finder

模式|按键|描述|
---|--|--|
`lsp_finder`| `o|\<CR\>`|在新 buffer 打开
`lsp_finder`| wwl | 在右边👉窗口打开
`lsp_finder`| wwj | 在下边👇窗口打开
`lsp_finder`| `q|\<ESC\>`| 关闭浮动窗口


code action 

模式|按键|描述|
--|---|---|
`code ation`|q|关闭代码修复窗口|
`code ation`|\<CR\>|确定代码修复|


peek definition


模式|按键|描述|
--|---|---|
`peek definition`| o | 在新 buffer 打开
`peek definition`| wwl | 在右边👉窗口打开
`peek definition`|wwj 在下边👇窗口打开
`peek definition`|q|关闭浮动窗口


null ls


模式|按键|描述|
--|---|---|
`n``v`|\<leader\>/|格式化代码


tree 

模式|按键|描述|
--|---|---|
`n`|tt|打开关闭文件管理器


tree 

模式|按键|描述|
--|---|---|
`tree`|.|显示隐藏文件
`tree`|a|新建文件
`tree`|d|删除文件
`tree`|r|重命名文件
`tree`|x|剪切文件
`tree`|c|复制文件
`tree`|p|粘贴文件
`tree`|s|在系统管理器打开
`tree`|o|进入选择的文件夹
`tree`|h|显示文件信息
`tree`|wwl|在右边👉窗口打开
`tree`|wwj|在下边👇窗口打开




telescopt

模式|按键|描述|
---|---|--|
`n`|\<leader\>ff|搜索文件
`n`|\<leader\>fw|搜索文件内容
`n`|\<leader\>fp|搜索复制内容
`n`|\<ledaer\>fe|搜索环境变量
`telescopt`|\<A-j\>|选择下一个选项
`telescopt`|\<A-k\>|选择上一个选项
`telescopt`|\<A-h\>|上一个历史选择
`telescopt`|\<A-j\>|下一个历史选择
`telescopt`|\<A-q\>|退出搜索
`telescopt`|\<A-u\>|预览窗口向上👆滚动
`telescopt`|\<A-n\>|预览窗口向下👇滚动






buffer

模式|按键|描述|
----|----|---|
`n`|\<leader\>bj|下一个 buffer
`n`|\<leader\>bk|上一个 buffer
`n`|\<leader\>b`,|<`|关闭左边👈的 buffer
`n`|\<leader\>b`.|>`|关闭右边👉的buffer
`n`|\<leader\>bc|关闭当前buffer



dap 


模式|按键|描述
---|---|----
`n`|\<leader\>db|打断点
`n`|\<leader\>dp|暂停调试
`n`|\<leader\>ds|恢复 开始 或者 跳转到下一个断点
`n`|\<leader\>dj|单步调试
`n`|\<leader\>dk|跳出当前函数
`n`|\<leader\>dh|后退上一个函数
`n`|\<leader\>dl|跳到下一个函数调用
`n`|\<leader\>dr|重新调试
`n`|\<leader\>dc|停止调试
`n`|\<leader\>dt|打开关闭调试界面


模式|按键|描述
--|--|--
`n``v`|gcc|以注释行的方式注释代码
`n``v`|gbc|以注释多行的方式注释代码




































----





























