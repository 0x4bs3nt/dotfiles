return {
    'folke/noice.nvim',
    event = 'VeryLazy',
    dependencies = {
        'MunifTanjim/nui.nvim',
        'rcarriga/nvim-notify',
    },
    config = function()
        require('notify').setup({
            stages = 'fade',
            timeout = 3000,
            render = 'wrapped-compact',
            max_width = 50,
        })

        require('noice').setup({
            cmdline = {
                enabled = true,
                view = 'cmdline_popup',
                format = {
                    cmdline = { pattern = '^:', icon = ' ', lang = 'vim' },
                    search_down = { kind = 'search', pattern = '^/', icon = '  ', lang = 'regex' },
                    search_up = { kind = 'search', pattern = '^%?', icon = '  ', lang = 'regex' },
                    filter = { pattern = '^:%s*!', icon = ' $ ', lang = 'bash' },
                    lua = { pattern = { '^:%s*lua%s+', '^:%s*lua%s*=%s*', '^:%s*=%s*' }, icon = ' ', lang = 'lua' },
                },
            },
            messages = {
                enabled = true,
                view = 'notify',
                view_error = 'notify',
                view_warn = 'notify',
            },
            popupmenu = {
                enabled = true,
                backend = 'nui',
            },
            lsp = {
                override = {
                    ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
                    ['vim.lsp.util.stylize_markdown'] = true,
                },
                hover = { enabled = true },
                signature = { enabled = false },
                progress = {
                    enabled = true,
                    view = 'mini',
                },
            },
            presets = {
                bottom_search = false,
                command_palette = true,
                long_message_to_split = true,
                lsp_doc_border = true,
            },
        })
    end,
}
