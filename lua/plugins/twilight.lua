local opts = {
	dimming = {
		alpha = 0.7, -- amount of dimming
		-- we try to get the foreground from the highlight groups or fallback color
		inactive = false, -- when true, other windows will be fully dimmed (unless they contain the same buffer)

	},
    treesitter = true,
  context = 1000,
	-- your configuration comes here
	-- or leave it empty to use the default settings
	-- refer to the configuration section below
}
local twilight = require("twilight")
twilight.setup(opts)
twilight.enable()
