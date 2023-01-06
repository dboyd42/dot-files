-- https://github.com/neovim/nvim-lspconfig/wiki/Autocompletion ---------------
--      see: packer-config/init.lua

-- nvim-cmp setup -----aka, import the actual plugins -----
-- luasnip setup
local luasnip = require 'luasnip'
local cmp = require 'cmp'
local lspkind = require('lspkind')

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  -- mappings to navigate through your completion items
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  ----- srcs for the snippets -----
  sources = { 
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
  -- END autocompletion

  -- Icons | https://github.com/onsails/lspkind.nvim --------------------------
  formatting = {
    format = lspkind.cmp_format({
      -- defines how annotations are shown
      mode = 'symbol_text', 
      maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)

      -- The function below will be called before any actual modifications from lspkind
      -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
      before = function (entry, vim_item)
        return vim_item
      end
    })
  }

} -- END nvim-cmp

