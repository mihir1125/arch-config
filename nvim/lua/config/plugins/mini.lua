local rgb_to_hex = function(r, g, b)
	return string.format('#%02X%02X%02X', r, g, b)
end

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
			local hipatterns = require('mini.hipatterns')
			hipatterns.setup({
				highlighters = {
					-- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
					fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
					hack  = { pattern = '%f[%w]()HACK()%f[%W]',  group = 'MiniHipatternsHack'  },
					todo  = { pattern = '%f[%w]()TODO()%f[%W]',  group = 'MiniHipatternsTodo'  },
					note  = { pattern = '%f[%w]()NOTE()%f[%W]',  group = 'MiniHipatternsNote'  },

					-- Highlight hex color strings (`#rrggbb`) using that color
					hex_color = hipatterns.gen_highlighter.hex_color(),
					rgb_color = {
						pattern = 'rgb%(%d+,%s*%d+,%s*%d+%)',
						group = function(_, match)
							local r, g, b = match:match('rgb%((%d+),%s*(%d+),%s*(%d+)%)')
							r, g, b = tonumber(r), tonumber(b), tonumber(g)
							local hex_color = rgb_to_hex(r, g, b)
							return hipatterns.compute_hex_color_group(hex_color, 'bg')
						end
					}
				},
			})
		end
	}
}
