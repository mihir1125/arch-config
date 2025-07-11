return {
	{
		'echasnovski/mini.nvim',
		config = function()
			local statusline = require 'mini.statusline'
			statusline.setup { use_icons = true }
			local pairs = require 'mini.pairs'
			pairs.setup()
			local surround = require 'mini.surround'
			surround.setup()
		end
	}
}
