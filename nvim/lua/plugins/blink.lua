return {
    'saghen/blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets' },

    version = '1.*',

    opts = {
        keymap = { preset = 'enter' },

        appearance = {
            use_nvim_cmp_as_default = true,
            nerd_font_variant = 'mono',
            kind_icons = {
                Text = '󰉿',
                Method = '󰊕',
                Function = '󰊕',
                Constructor = '󰒓',
                Field = '󰜢',
                Variable = '󰀫',
                Class = '󰠱',
                Interface = '',
                Module = '',
                Property = '󰜢',
                Unit = '󰑭',
                Value = '󰎠',
                Enum = '',
                Keyword = '󰌋',
                Snippet = '',
                Color = '󰏘',
                File = '󰈙',
                Reference = '󰈇',
                Folder = '󰉋',
                EnumMember = '',
                Constant = '󰏿',
                Struct = '󰙅',
                Event = '',
                Operator = '󰆕',
                TypeParameter = '',
            },
        },

        completion = {
            ghost_text = { enabled = true },
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 200,
                window = { border = 'rounded' },
            },
            menu = {
                border = 'rounded',
                draw = {
                    treesitter = { 'lsp' },
                    padding = { 0, 1 },
                    columns = {
                        { 'item_idx' },
                        { 'kind_icon' },
                        { 'label', 'label_description', gap = 1 },
                        { 'kind', 'source_name', gap = 1 },
                    },
                    components = {
                        item_idx = {
                            text = function(ctx)
                                return ctx.idx == 10 and '0' or ctx.idx >= 10 and ' ' or tostring(ctx.idx)
                            end,
                            highlight = 'BlinkCmpItemIdx',
                        },
                        kind_icon = {
                            text = function(ctx)
                                return ' ' .. ctx.kind_icon .. ctx.icon_gap .. ' '
                            end,
                        },
                    },
                },
            },
        },

        signature = {
            enabled = true,
            window = { border = 'rounded' },
        },

        fuzzy = { implementation = 'prefer_rust_with_warning' },
    },
}
