return {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    event = { 'BufReadPost', 'BufNewFile' },
    config = function()
        local hooks = require('ibl.hooks')

        local function set_scope_color()
            local bg = vim.o.background
            local color = bg == 'light' and '#7287A0' or '#81A1C1'
            vim.api.nvim_set_hl(0, 'IblScope', { fg = color })
        end

        hooks.register(hooks.type.HIGHLIGHT_SETUP, set_scope_color)

        vim.api.nvim_create_autocmd('ColorScheme', {
            callback = set_scope_color,
        })

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
