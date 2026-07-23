return {
	dir="~/repos/convert.nvim",
	-- 'cjodo/convert.nvim',
	dependencies = { 'MunifTanjim/nui.nvim' },
	config = function ()
		local convert = require("convert")
		convert.setup{
			modes = { "size", "color" }
		}

		require("which-key").add({
			{"<leader>c", group="convert"}
		})
	end,

	keys = {
		{ "<leader>cn", "<cmd>ConvertFindNext<CR>", desc = "Find next convertable unit" },
		{ "<leader>cc", "<cmd>ConvertFindCurrent<CR>", desc = "Find convertable unit in current line" },
		{ "<leader>ca", "<cmd>ConvertAll<CR>", mode = { "n", "v" }, desc = "Convert all of a specified unit" },
	},
}
