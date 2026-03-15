return {
    {
        'catppuccin/nvim',
        name = 'catppuccin',
        priority = 1000,
        lazy = false,
        opts = {
            flavour = 'latte',
            background = { light = 'latte' },
            no_italic = false,
            no_bold = false,
            integrations = {
                bufferline = true,
                dashboard = true,
                indent_blankline = { enabled = true, scope_color = 'lavender' },
                mason = true,
                neotree = true,
                noice = true,
                telescope = { enabled = true, style = 'nvchad' },
                treesitter = true,
                which_key = true,
            },
        },
    },
    {
        'f-person/auto-dark-mode.nvim',
        priority = 900,
        lazy = false,
        opts = {
            update_interval = 1000,
            set_dark_mode = function()
                vim.o.background = 'dark'
                vim.cmd.colorscheme('nordic')
            end,
            set_light_mode = function()
                vim.o.background = 'light'
                vim.cmd.colorscheme('catppuccin-latte')
            end,
        },
    },
}
