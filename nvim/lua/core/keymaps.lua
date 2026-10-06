-- Set leader key
vim.g.mapleader = ' '
-- vim.g.maplocalleader = ' '

-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- For conciseness
local opts = { noremap = true, silent = true }

-- save file
vim.keymap.set('n', '<C-s>', '<cmd> w <CR>', opts)

-- save file without auto-formatting
vim.keymap.set('n', '<leader>sn', '<cmd>noautocmd w <CR>', opts)

-- quit file
vim.keymap.set('n', '<C-q>', '<cmd> q <CR>', opts)

-- delete single character without copying into register
vim.keymap.set('n', 'x', '"_x', opts)

-- Vertical scroll and center
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)

-- Find and center
vim.keymap.set('n', 'n', 'nzzzv', opts)
vim.keymap.set('n', 'N', 'Nzzzv', opts)

-- Resize with arrows
vim.keymap.set('n', '<Up>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<Down>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<Right>', ':vertical resize +2<CR>', opts)

-- Buffers
vim.keymap.set('n', '<Tab>', ':bnext<CR>', opts)
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', opts)
vim.keymap.set('n', '<leader>x', ':bdelete!<CR>', opts) -- close buffer
vim.keymap.set('n', '<leader>b', '<cmd> enew <CR>', opts) -- new buffer

-- Window management
vim.keymap.set('n', '<leader>v', '<C-w>v', opts) -- split window vertically
vim.keymap.set('n', '<leader>h', '<C-w>s', opts) -- split window horizontally
vim.keymap.set('n', '<leader>se', '<C-w>=', opts) -- make split windows equal width & height
vim.keymap.set('n', '<leader>xs', ':close<CR>', opts) -- close current split window

-- Navigate between splits
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>', opts)
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>', opts)
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>', opts)
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>', opts)

-- Tabs
vim.keymap.set('n', '<leader>to', ':tabnew<CR>', opts) -- open new tab
vim.keymap.set('n', '<leader>tx', ':tabclose<CR>', opts) -- close current tab
vim.keymap.set('n', '<leader>tn', ':tabn<CR>', opts) --  go to next tab
vim.keymap.set('n', '<leader>tp', ':tabp<CR>', opts) --  go to previous tab

-- Toggle line wrapping
vim.keymap.set('n', '<leader>lw', '<cmd>set wrap!<CR>', opts)

-- Stay in indent mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- Keep last yanked when pasting
vim.keymap.set('v', 'p', '"_dP', opts)

-- Paste yanked on new line below
vim.keymap.set('n', '<C-p>', '<Cmd>put<CR>', opts)

-- Paste yanked on new line above 
vim.keymap.set('n', '<C-p>', '<Cmd>put!<CR>', opts)

-- Diagnostic keymaps
vim.keymap.set('n', '[d', function()
  vim.diagnostic.jump { count = -1, float = true }
end, { desc = 'Go to previous diagnostic message' })

vim.keymap.set('n', ']d', function()
  vim.diagnostic.jump { count = 1, float = true }
end, { desc = 'Go to next diagnostic message' })

vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- small terminal on the botton
vim.keymap.set('n', '<leader>st', function()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 10)
end)

-- run the current script in python
vim.keymap.set('n', '<leader>run', ':!python %<CR>', opts)

-- Delete tab with S-T on Insert mode
-- vim.keymap.set('i', '<S-Tab>', '<BS>', opts)

-- Press jk fast to exit insert mode
vim.keymap.set('i', 'jk', '<ESC>', opts)
vim.keymap.set('i', 'kj', '<ESC>', opts)

-- exit terminal mode into Normal mode
vim.keymap.set('t', '<C-[>','<C-\\><C-n>', opts)

-- Molten Keymaps

-- -- Automatically launch the correct Kernel from Molten.nvim
-- vim.keymap.set("n", "<leader>mi", function()
--   local venv = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX")
--   if venv ~= nil then
--     -- in the form of /home/benlubas/.virtualenvs/VENV_NAME
--     venv = string.match(venv, "/.+/(.+)")
--     vim.cmd(("MoltenInit %s"):format(venv))
--   else
--     vim.cmd("MoltenInit python3")
--   end
-- end, { desc = "Initialize Molten for python3", silent = true })
--
-- vim.keymap.set("n", "<leader>mr", ":MoltenEvaluateOperator<CR>", { desc = "evaluate operator", silent = true })
-- vim.keymap.set("n", "<leader>ml", ":MoltenEvaluateLine<CR>", { desc = "evaluate line", silent = true })
-- vim.keymap.set("n", "<leader>moo", ":noautocmd MoltenEnterOutput<CR>", { desc = "open output window", silent = true })
-- vim.keymap.set("n", "<leader>me", ":MoltenReevaluateCell<CR>", { desc = "re-eval cell", silent = true })
-- vim.keymap.set("v", "<leader>mrv", ":<C-u>MoltenEvaluateVisual<CR>gv", { desc = "execute visual selection", silent = true })
-- vim.keymap.set("n", "<leader>mco", ":MoltenHideOutput<CR>", { desc = "close output window", silent = true })
-- vim.keymap.set("n", "<leader>md", ":MoltenDelete<CR>", { desc = "delete Molten cell", silent = true })
-- -- if you work with html outputs:
-- -- vim.keymap.set("n", "<localleader>mx", ":MoltenOpenInBrowser<CR>", { desc = "open output in browser", silent = true })
-- -- Keymap to select python blocks inside ipynb files
-- --
-- vim.keymap.set("n", "<leader>vib", function()
--     -- search backwards for the start of the block
--     local start_line = vim.fn.search('^```python\\s*$', 'bnW')
--     -- search forwards for the end of the block
--     local end_line = vim.fn.search('^```\\s*$', 'nW')
--
--     if start_line > 0 and end_line > start_line + 1 then
--         -- move cursor to start of selection
--         vim.api.nvim_win_set_cursor(0, { start_line + 1, 0})
--         -- enter visual line mode
--         vim.cmd('normal! V')
--         -- move cursor to end of selection
--         vim.api.nvim_cursor(0, { end_line - 1, 0})
--     else
--         print("No Python code block found.")
--     end
-- end, { desc = "Select inside Pyhton code block"})
--
