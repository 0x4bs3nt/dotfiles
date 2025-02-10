vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

local auto_save_group = vim.api.nvim_create_augroup("AutoSaveGroup", { clear = true })

vim.api.nvim_create_autocmd({ "InsertLeave", "CmdlineLeave" }, {
	group = auto_save_group,
	callback = function()
		-- Check if the buffer is modified
		if vim.bo.modified then
			-- Save the buffer
			vim.cmd("write")
			-- Print the message
			print("Auto-saved changes")
		end
	end,
})
