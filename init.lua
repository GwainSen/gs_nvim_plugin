--includes
require("gs_nvim_plugin.remap")
local colorset = require "gs_nvim_plugin.color"

--plugins:
--mason
vim.pack.add{
	{src = "https://github.com/mason-org/mason.nvim"}
}

--plugin setup:
require("mason").setup()

--basic nvim setting:
---------------------
--line numbers
vim.opt.number = true
vim.opt.relativenumber = true

--clipboard 
--install gnome: xclip
--on hyprland: wl-clipboard
vim.opt.clipboard = "unnamedplus"

--code
print("debug msg: gs_nvim_plugin plugin loaded")
print(vim.api.nvim_win_get_width(0))
print(vim.api.nvim_win_get_height(0))
--vim.api.nvim_tabpage_set_win(0, 0)

--set colors 
colorset.set_colorscheme()

--tests
--require'lspconfig'.lua_ls.setup{}
-- not working needs more time

vim.lsp.config('luals', {
  cmd = {'lua-language-server'},
  filetypes = {'lua'},
  root_markers = {'.luarc.json', '.luarc.jsonc'},
})

vim.lsp.config('clangd', {
  cmd = {'clangd'},
  init_options = { fallbackFlags = { "-std=c++26"} },
  filetypes = {'c','cpp'},
  root_markers = {},
})

vim.lsp.config('gopls', {
  cmd = {'gopls'},
  filetypes = {'go'},
  root_markers = {},
})

vim.lsp.enable('luals')
vim.lsp.enable('clangd')
vim.lsp.enable('gopls')
