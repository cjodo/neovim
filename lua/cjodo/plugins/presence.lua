return {
	"cjodo/presence.nvim",
	-- dir = "~/repos/presence.nvim",
	config = function ()
		require("presence").setup({
			user = "Curtis",

			endpoints = {
				"https://cjodo.com/api/presence",
				"http://localhost:8080/api/presence",
				"http://localhost:3000/api/presence",
				"http://localhost:3000/presence",
			},
			heartbeat_interval=15
		})
	end
}
