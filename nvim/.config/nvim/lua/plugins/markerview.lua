return {
    {"OXY2DEV/markview.nvim",
    lazy = false,
    },
    {
      "daenikon/marknav.nvim",
      ft = { "markdown", "md" },
      config = function()
        require("marknav").setup()
      end
    }
        

    -- Completion for `blink.cmp`
    -- dependencies = { "saghen/blink.cmp" },
};
