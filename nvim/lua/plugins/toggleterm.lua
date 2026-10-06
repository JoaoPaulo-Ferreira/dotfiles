return {
  'akinsho/toggleterm.nvim',
  version = "*",
  opts = {
    float_opts = {
      -- The border key is *almost* the same as 'nvim_open_win'
      -- see :h nvim_open_win for details on borders however
      -- the 'curved' border is a custom border type
      -- not natively supported but implemented in this plugin.
      border = "rounded",
      -- like `size`, width, height, row, and col can be a number or function which is passed the current terminal

      width = vim.o.columns,
      height = math.ceil(vim.o.lines * 0.3),
      row = vim.o.lines,
      col = vim.o.columns,
      anchor = "SE",
      title_pos = "center",
    },

  },

}
