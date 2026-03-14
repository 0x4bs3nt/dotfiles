return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require('lualine').setup({
            options = {
                theme = 'nordic',
                component_separators = { left = '│', right = '│' },
                section_separators = { left = '', right = '' },
                globalstatus = true,
                disabled_filetypes = { statusline = { 'dashboard' } },
            },
            sections = {
                lualine_a = {
                    { 'mode', fmt = function(str) return str:sub(1, 3) end },
                },
                lualine_b = {
                    { 'branch', icon = '' },
                    {
                        'diff',
                        symbols = { added = ' ', modified = ' ', removed = ' ' },
                    },
                },
                lualine_c = {
                    { 'filetype', icon_only = true, separator = '', padding = { left = 1, right = 0 } },
                    { 'filename', path = 1, symbols = { modified = ' ●', readonly = ' ', unnamed = '[No Name]' } },
                },
                lualine_x = {
                    {
                        'diagnostics',
                        symbols = { error = ' ', warn = ' ', info = ' ', hint = '󰌵 ' },
                    },
                },
                lualine_y = { 'filetype' },
                lualine_z = {
                    { 'location', padding = { left = 1, right = 1 } },
                    { 'progress' },
                },
            },
        })
    end,
}
