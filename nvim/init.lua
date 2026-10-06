require 'core.options'
require 'core.keymaps'
-- require 'core.frameworks-keymap-runs'
-- require 'core.model-keymap-runs'

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    require 'plugins.neotree',
    require 'plugins.bufferline',
    require 'plugins.lualine',
    require 'plugins.treesitter',
    require 'plugins.telescope',
    require 'plugins.lsp',
    require 'plugins.autocompletion',
    --require 'plugins.none-ls',
    require 'plugins.gitsigns',
    require 'plugins.alpha',
    require 'plugins.indent-blankline',
    require 'plugins.misc',
    require 'plugins.debug',
    require 'plugins.vimtex',
    require 'plugins.quarto',
    require 'plugins.molten',
    -- require 'plugins.mini-comments',
    -- require 'plugins.toggleterm',
    -- THEMES 
    -- require 'themes.nordtheme',
    require 'themes.kanagawa',
    -- require 'themes.tokyonight'
    require 'plugins.markerview'
})
