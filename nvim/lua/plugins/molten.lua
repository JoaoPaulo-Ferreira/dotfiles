return {
    {
        "benlubas/molten-nvim",
        version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
        dependencies = { "3rd/image.nvim" },
        build = ":UpdateRemotePlugins",
        init = function()
            -- these are examples, not defaults. Please see the readme
            vim.g.molten_image_provider = "image.nvim"
            vim.g.molten_output_win_max_height = 20
        end,
        keys = {
            -- Automatically launch the correct Kernel from Molten.nvim
            vim.keymap.set("n", "<leader>mi", function()
              local venv = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX")
              if venv ~= nil then
                -- in the form of /home/benlubas/.virtualenvs/VENV_NAME
                venv = string.match(venv, "/.+/(.+)")
                vim.cmd((":MoltenInit %s"):format(venv))
              else
                vim.cmd(":MoltenInit python3")
              end
            end, { desc = "Initialize Molten for python3", silent = true }),

            -- vim.keymap.set("n", "<leader>mr", ":MoltenEvaluateOperator<CR>", { desc = "evaluate operator", silent = true }),
            
            vim.keymap.set("n", "<leader>ml", ":MoltenEvaluateLine<CR>", { desc = "evaluate line", silent = true }),
            
            vim.keymap.set("n", "<leader>moo", ":noautocmd MoltenEnterOutput<CR>", { desc = "open output window", silent = true }),
            
            -- vim.keymap.set("n", "<leader>me", ":MoltenReevaluateCell<CR>", { desc = "re-eval cell", silent = true }),

            vim.keymap.set("v", "<leader>mvr", ":<C-u>MoltenEvaluateVisual<CR>gv", { desc = "execute visual selection", silent = true }),

            vim.keymap.set("n", "<leader>moc", ":MoltenHideOutput<CR>", { desc = "close output window", silent = true }),

            -- vim.keymap.set("n", "<leader>mvib", function()
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
            -- end, { desc = "Select inside Pyhton code block"}),

            -- vim.keymap.set("n", )
            vim.keymap.set("n", "<leader>md", ":MoltenDelete<CR>", { desc = "delete Molten cell", silent = true }),

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
            end, { desc = "Select inside Pyhton code block"}),

            vim.keymap.set("v", "<leader>mr", "<leader>msc <leader>mvr", { desc = "run cell", silent = true }),
        }
    },
    {
        -- see the image.nvim readme for more information about configuring this plugin
        "3rd/image.nvim",
        build = false,
        opts = {
            backend = "kitty", -- whatever backend you would like to use
            processor =  "magick_cli",
            max_width = 100,
            max_height = 12,
            max_height_window_percentage = math.huge,
            max_width_window_percentage = math.huge,
            window_overlap_clear_enabled = true, -- toggles images when windows are overlapped
            window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
        },
    },
    {
        "GCBallesteros/jupytext.nvim",
        opts = {
          custom_language_formatting = {
            python = {
              extension = 'qmd',
              style = 'quarto',
              force_ft = 'quarto',
            },
            r = {
              extension = 'qmd',
              style = 'quarto',
              force_ft = 'quarto',
            },
          },
        },
        -- config = true,
        -- style = "markdown",
        -- output_extetion = "md",
        -- force_ft = "markdown",
        -- Depending on your nvim distro or config you may need to make the loading not lazy
        lazy=false,
    }

}
