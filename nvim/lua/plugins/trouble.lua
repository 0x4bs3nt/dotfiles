return {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    cmd = 'Trouble',
    keys = {
        { '<leader>xx', '<cmd>Trouble diagnostics toggle<cr>', desc = 'Diagnostics (Trouble)' },
        { '<leader>xX', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', desc = 'Buffer Diagnostics (Trouble)' },
        { '<leader>xs', '<cmd>Trouble symbols toggle focus=false win.size=0.4<cr>', desc = 'Symbols (Trouble)' },
        { '<leader>xl', '<cmd>Trouble loclist toggle<cr>', desc = 'Location List (Trouble)' },
        { '<leader>xq', '<cmd>Trouble qflist toggle<cr>', desc = 'Quickfix List (Trouble)' },
        { '<leader>xt', '<cmd>Trouble todo toggle<cr>', desc = 'Todos (Trouble)' },
    },
    opts = {},
}
