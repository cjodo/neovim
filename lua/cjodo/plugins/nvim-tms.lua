return {
	dir="~/repos/nvim-tms",
		-- "cjodo/nvim-tms",
	config = function()
		require("nvim-tms").setup({
			cmd = "lazygit",
		})
	end
}
