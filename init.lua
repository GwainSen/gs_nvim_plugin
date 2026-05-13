--TODOs:
--add language server 

--includes 
local colorset = require "gs_nvim_plugin.lua.color"

--basic nvim setting:
---------------------
--line numbers
vim.opt.number = true

--code
print("debug msg: gs_nvim_plugin plugin loaded")
print(vim.api.nvim_win_get_width(0))
print(vim.api.nvim_win_get_height(0))
--vim.api.nvim_tabpage_set_win(0, 0)

--set colors 
colorset.set_colorscheme()

--tests


