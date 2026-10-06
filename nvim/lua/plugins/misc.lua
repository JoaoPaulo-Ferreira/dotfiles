-- Standalone plugins with less than 10 lines of config go here
return {
  -- {
  --   -- Tmux & split window navigation
  --   'christoomey/vim-tmux-navigator',
  -- },
  -- {
  --   -- Detect tabstop and shiftwidth automatically
  --   'tpope/vim-sleuth',
  -- },
  -- {
  --   -- Powerful Git integration for Vim
  --   'tpope/vim-fugitive',
  -- },
  -- {
  --   -- GitHub integration for vim-fugitive
  --   'tpope/vim-rhubarb',
  -- },
  {
    -- Hints keybinds
    'folke/which-key.nvim',
  },
  {
    -- Autoclose parentheses, brackets, quotes, etc.
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true,
    opts = {},
  },
  -- {
  --   -- Highlight todo, notes, etc in comments
  --   'folke/todo-comments.nvim',
  --   event = 'VimEnter',
  --   dependencies = { 'nvim-lua/plenary.nvim' },
  --   opts = { signs = false },
  -- },
  {
    -- High-performance color highlighter
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end,
  },
  -- {
  --   -- Add, delete, change surrounding strings
  --   "kylechui/nvim-surround",
  --   version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
  --   event = "VeryLazy",
  --   config = function()
  --       require("nvim-surround").setup({
  --           -- Configuration here, or leave empty to use defaults
  --       })
  --   end
  -- },
  --testing dotenv
  -- {
  --   "ellisonleao/dotenv.nvim",
  --   config = function ()
  --     require("dotenv").setup()
  --   end,
  --   opts = {
  --   -- enable_on_load = true, -- will load your .env file upon loading a buffer
  --     verbose = true, -- show error notification if .env file is not found and if .env is loaded
  --   -- file_name = 'myenvfile.env' -- will override the default file name '.env'
  --   },
  -- },
  --
  -- {
  --   "let-def/texpresso.vim",        -- Live preview of latex files using texpresso.
  -- },
}
