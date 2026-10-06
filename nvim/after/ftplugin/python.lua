



-- Starting keymaps for python notebook files (files with ipynb extension)
if vim.fn.expand("%:e") ~= "ipynb" then
    return
end

local opts = {buffer = true, silent = true}

vim.keymap.set("n", "<leader>msc", function()
    -- search backwards for the start of the block
    local start_line = vim.fn.search('^# %%', 'bnW')
    -- search forwards for the end of the block
    local end_line = vim.fn.search('^# %%', 'nW')
    if start_line > 0 and end_line > start_line + 1 then
        -- move cursor to start of selection
        vim.api.nvim_win_set_cursor(0, { start_line + 1, 0})
        -- enter visual line mode
        vim.cmd('normal! V')
        local size = (end_line - 1) - (start_line + 1)
        vim.cmd('normal! '..size..'j')
        -- move cursor to end of selection
        -- vim.api.nvim_cursor(0, { end_line - 1, 0})
        vim.api.nvim_win_set_cursor(0, { end_line - 1, 0})
    else
        print("No Python code block found.")
    end
end, { desc = "Select inside Pyhton code block"})


vim.keymap.set("v", "<leader>mr", "<leader>msc <leader>mvr", { desc = "run cell", silent = true })
-- vim.keymap.set("n", "<c-rc>", ":echo Test<CR>" )
