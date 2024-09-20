return {
  {
    'lervag/vimtex',
    lazy = false,
    init = function() end,
  },
  {
    'quarto-dev/quarto-nvim',
    dependencies = {
      'jmbuhr/otter.nvim',
      'neovim/nvim-lspconfig',
    },
    config = function()
      require('quarto').setup {
        lspFeatures = {
          enabled = true,
          languages = { 'r', 'python', 'julia', 'bash', 'html' },
          diagnostics = {
            enabled = true,
            triggers = { 'BufWrite' },
          },
          completion = {
            enabled = true,
          },
        },
      }
    end,
  },

  -- Send code from R/Python/Qmd documents to a terminal like R, bash, iPython
  { 'jpalardy/vim-slime' },

  -- Paste an image to markdown from the clipboard with :PasteImg
  'ekickx/clipboard-image.nvim',

  { -- highlight markdown headings and code blocks etc.
    'lukas-reineke/headlines.nvim',
    enabled = true,
    dependencies = 'nvim-treesitter/nvim-treesitter',
    config = function()
      require('headlines').setup {
        quarto = {
          query = vim.treesitter.query.parse(
            'markdown',
            [[
                (fenced_code_block) @codeblock
                ]]
          ),
          codeblock_highlight = 'CodeBlock',
          treesitter_language = 'markdown',
        },
        markdown = {
          query = vim.treesitter.query.parse(
            'markdown',
            [[
                (fenced_code_block) @codeblock
                ]]
          ),
          codeblock_highlight = 'CodeBlock',
        },
      }
    end,
  },

}
