return {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    event = { 'BufReadPost', 'BufNewFile' },
    config = function()
        local hooks = require('ibl.hooks')

        hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
            vim.api.nvim_set_hl(0, 'IblScope', { fg = '#81A1C1' })
        end)

        require('ibl').setup({
            indent = {
                char = '│',
                tab_char = '│',
            },
            scope = {
                enabled = true,
                show_start = false,
                show_end = false,
                highlight = 'IblScope',
            },
            exclude = {
                filetypes = { 'help', 'dashboard', 'neo-tree', 'lazy', 'mason', 'notify' },
            },
        })
    end,
}
