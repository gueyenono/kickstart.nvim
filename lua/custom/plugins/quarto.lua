return {
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
}
