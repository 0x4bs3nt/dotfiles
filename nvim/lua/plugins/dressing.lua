return {
    'stevearc/dressing.nvim',
    event = 'VeryLazy',
    opts = {
        input = {
            enabled = true,
            default_prompt = '> ',
            border = 'rounded',
            relative = 'cursor',
            prefer_width = 40,
            win_options = {
                winblend = 10,
            },
        },
        select = {
            enabled = true,
            backend = { 'telescope', 'builtin' },
        },
    },
}
