return {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    event = 'VeryLazy',
    keys = {
        { '<S-h>', '<cmd>BufferLineCyclePrev<cr>', desc = 'Prev Buffer' },
        { '<S-l>', '<cmd>BufferLineCycleNext<cr>', desc = 'Next Buffer' },
        { '<leader>bp', '<cmd>BufferLineTogglePin<cr>', desc = 'Pin Buffer' },
        { '<leader>bx', '<cmd>bdelete<cr>', desc = 'Close Buffer' },
    },
    opts = {
        options = {
            mode = 'buffers',
            themable = true,
            diagnostics = 'nvim_lsp',
            diagnostics_indicator = function(_, _, diag)
                local icons = { error = ' ', warning = ' ', hint = '󰌵 ' }
                local ret = (diag.error and icons.error .. diag.error .. ' ' or '')
                    .. (diag.warning and icons.warning .. diag.warning .. ' ' or '')
                    .. (diag.hint and icons.hint .. diag.hint or '')
                return vim.trim(ret)
            end,
            offsets = {
                {
                    filetype = 'neo-tree',
                    text = '  File Explorer',
                    highlight = 'Directory',
                    text_align = 'left',
                    separator = true,
                },
            },
            separator_style = 'thin',
            show_buffer_close_icons = false,
            show_close_icon = false,
            color_icons = true,
            always_show_bufferline = false,
        },
    },
}
