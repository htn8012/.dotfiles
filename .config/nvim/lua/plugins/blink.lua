return {
  'saghen/blink.cmp',
  enabled = false,
  dependencies = 'rafamadriz/friendly-snippets',
  version = '*',
  opts = {
    keymap = {
      preset = "super-tab",
    },
    completion = {
      menu = {
        border = "rounded",
        draw = {
          columns = { { 'item_idx' }, { 'kind_icon' }, { 'label', 'label_description', gap = 1 } },
          components = {
            item_idx = {
              text = function(ctx)
                return tostring(ctx.idx)
              end,
            },
          },
        },
      },
      documentation = {
        window = {
          border = "rounded"
        }
      }
    },
    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = 'mono'
    },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
  },
  opts_extend = { "sources.default" }
}
