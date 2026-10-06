-- Default options:
return {
    "rebelot/kanagawa.nvim",
    -- lazy = 'false',
    priority = 1000,
    --vim.cmd [[colorscheme kanagawa]]
    config = function()
        require('kanagawa').setup({
    --         theme = "wave",              -- load "wave" theme
    --         background = {               -- map the value of 'background' option to a theme
    --         dark = "wave",           -- try "dragon" !
    -- --         -- dark = "dragon",           -- try "dragon" !
    --         light = "lotus"
    --         },
        })
        -- require('kanagawa').set()
        -- vim.cmd.colorscheme("kanagawa-wave")
        vim.cmd.colorscheme("kanagawa-dragon")
        -- vim.cmd.colorscheme("kanagawa-lotus")
    end
}
