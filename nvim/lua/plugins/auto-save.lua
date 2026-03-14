return {
    'Pocco81/AutoSave.nvim',
    config = function()
        require('auto-save').setup({
            enabled = true,
            execution_message = {
                message = '',
            },

            vim.api.nvim_set_keymap('n', '<leader>ts', ':ASToggle<CR>', { noremap = true, silent = true }),
        })
    end,
}
