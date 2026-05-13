--includes
require("gs_nvim_plugin.remap")
local colorset = require "gs_nvim_plugin.color"

--plugins:
--mason
vim.pack.add {
	{ src = "https://github.com/mason-org/mason.nvim" }
}

--plugin setup:
require("mason").setup()

--basic nvim setting:
---------------------
--line numbers
vim.opt.number = true
vim.opt.relativenumber = true

--tab size
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

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

--add all needed LSPs
--(maybe add them in a Mason config)
vim.lsp.config('luals', {
	cmd = { 'lua-language-server' },
	filetypes = { 'lua' },
	root_markers = { '.luarc.json', '.luarc.jsonc' },
})

vim.lsp.config('clangd', {
	cmd = { 'clangd' },
	init_options = { fallbackFlags = { "-std=c++26" } },
	filetypes = { 'c', 'cpp' },
	root_markers = {},
})

vim.lsp.config('gopls', {
	cmd = { 'gopls' },
	filetypes = { 'go' },
	root_markers = {},
})

--enable all LSPs
vim.lsp.enable('luals')
vim.lsp.enable('clangd')
vim.lsp.enable('gopls')


--autocompletation
vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('my.lsp', {}),
	callback = function(ev)
		local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
		if client:supports_method('textDocument/implementation') then
			-- Create a keymap for vim.lsp.buf.implementation ...
		end

		-- Enable auto-completion. Note: Use CTRL-Y to select an item. |complete_CTRL-Y|
		if client:supports_method('textDocument/completion') then
			-- Optional: trigger autocompletion on EVERY keypress. May be slow!
			-- local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
			-- client.server_capabilities.completionProvider.triggerCharacters = chars

			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
		end

		-- Auto-format ("lint") on save.
		-- Usually not needed if server supports "textDocument/willSaveWaitUntil".
		--if not client:supports_method('textDocument/willSaveWaitUntil')
		--    and client:supports_method('textDocument/formatting') then
		--	vim.api.nvim_create_autocmd('BufWritePre', {
		--		group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
		--		buffer = ev.buf,
		--		callback = function()
		--			vim.lsp.buf.format({ bufnr = ev.buf, id = client.id, timeout_ms = 1000 })
		--		end,
		--	})
		--end
	end,
})
vim.cmd("set completeopt+=noselect")
