local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",

    -- c/cpp stuff
    "clangd",
    "clang-format",
  },
}

-- M.cmp = function()
--       local cmp = require 'cmp'
--   return {
--         mapping = cmp.mapping.preset.insert({
--           ["<C-k>"] = cmp.mapping.select_prev_item(),
--           ["<C-j>"] = cmp.mapping.select_next_item(),
--           ['<C-n>'] = cmp.mapping.scroll_docs(-4),
--           ['<C-p>'] = cmp.mapping.scroll_docs(4),
--         }),
--   }
-- end
M.cmp = {
         mapping = require 'cmp'.mapping.preset.insert({
           ["<C-k>"] = require 'cmp'.mapping.select_prev_item(),
           ["<C-j>"] = require 'cmp'.mapping.select_next_item(),
           ['<C-n>'] = require 'cmp'.mapping.scroll_docs(-4),
           ['<C-p>'] = require 'cmp'.mapping.scroll_docs(4),
         }),
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M
