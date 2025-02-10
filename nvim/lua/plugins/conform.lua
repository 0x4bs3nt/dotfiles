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
        format_on_save = function()
            return {
                timeout_ms = 500,
                lsp_fallback = true,
            }
        end,
        formatters_by_ft = {
            lua = { 'stylua' },

            python = { 'black' },
            -- python = { 'ruff' },

            -- javascript = { 'biome' },
            javascript = { 'prettierd' },

            html = { 'prettierd' },
        },
    },
}
