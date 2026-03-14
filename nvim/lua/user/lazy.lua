-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		"AlexvZyl/nordic.nvim",
		priority = 1000,
		lazy = false,
		init = function()
			require("nordic").setup({
				bold_keywords = true,
				italic_comments = true,
				transparent = { bg = false, float = false },
				bright_half = true,
				reduced_blue = true,
				swap_backgrounds = false,
				cursorline = { theme = "dark", blend = 0.7, bold = false },
				noice = { style = "flat" },
				telescope = { style = "flat" },
				ts_context = { dark_background = true },
				on_highlight = function(highlights, palette)
					highlights.WinSeparator = { fg = palette.gray2 }
					highlights.FloatBorder = { fg = palette.gray3, bg = palette.black1 }
					highlights.NormalFloat = { bg = palette.black1 }
				end,
			})
			vim.cmd.colorscheme("nordic")
		end,
	},

	{ import = "plugins" },
}, {
	rocks = { enabled = false },
})
