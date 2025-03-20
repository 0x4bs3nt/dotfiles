return {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
        {
            '<leader>f',
            function()
                require('conform').format({ async = true, lsp_fallback = true })
                vim.api.nvim_create_autocmd('BufWritePre', {
                    pattern = '*',
                    callback = function(args)
                        require('conform').format({ bufnr = args.buf })
                    end,
                })
            end,
            mode = '',
            desc = '[F]ormat buffer',
        },
    },
    opts = {
        notify_on_error = true,
        formatters_by_ft = {
            lua = { 'stylua' },

            -- python = { 'black' },
            -- python = { 'ruff' },

            javascript = { 'prettierd' },
            typescript = { 'prettierd' },
            typescriptreact = { 'prettierd' },

            css = { 'prettierd' },
            html = { 'prettierd' },
            json = { 'prettierd' },
        },
    },
}
