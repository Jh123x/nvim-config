return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local options = {
			theme = "dracula",
		}
		require("lualine").setup(options)
	end,
}
