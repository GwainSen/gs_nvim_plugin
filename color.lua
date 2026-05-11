local M = {}

local color = {
	fg = '#0f0f0f',
	red = '#ff0000',
	blue = '#0000ff',
	violet = '#7f00ff',
	green = '#00ff00',
	light_blue = '#90d5ff',
	light_purple = '#d6b4fc',
	light_gray = '#9ba19d',
	dark_red = '#8b0000',
	dark_yellow = '#ba8e23',
	cyan = '#00ffff',
	black_red = '#800000'
}

function M.set_colorscheme()

	local set = vim.api.nvim_set_hl
	set(0, 'Function', { fg = color.light_purple })
	--set(0, 'Normal', { fg = color.green })
	set(0, 'PreProc', { fg = color.light_blue })
	set(0, 'Type', { fg = color.dark_red })
	set(0, 'Comment', { fg = color.light_gray })
	set(0, 'Identifier', { fg = color.dark_yellow })
	set(0, 'Error', { fg = color.red })
	set(0, 'Constant', { fg = color.cyan})
	--statment
	--conditional
	--special
end

return M
