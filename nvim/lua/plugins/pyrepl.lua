return {
  -----------------------------------------------------------------
  -- Plugin definition
  -----------------------------------------------------------------
  "dangooddd/pyrepl.nvim",               -- ← GitHub repo
  dependencies = { "nvim-treesitter/nvim-treesitter" },

  -- Load the plugin on VimEnter (so the REPL is ready when you start)
  event = "VimEnter",

  -----------------------------------------------------------------
  -- Configuration
  -----------------------------------------------------------------
  config = function()
    -----------------------------------------------------------------
    -- 1️⃣  Core setup – you can drop any of the defaults you don’t
    --     need to change.
    -----------------------------------------------------------------
    require("pyrepl").setup({
      -----------------------------------------------------------------
      -- Layout
      -----------------------------------------------------------------
      split_horizontal = false,          -- vertical split (default)
      split_ratio      = 0.5,            -- 50 % of the screen

      -----------------------------------------------------------------
      -- Appearance
      -----------------------------------------------------------------
      style            = "default",     -- Pygments style name
      style_integration = true,         -- derive colours from your Neovim theme

      -----------------------------------------------------------------
      -- Image handling (works out‑of‑the‑box on kitty/ghostty)
      -----------------------------------------------------------------
      image_max_history = 30,            -- how many images to keep
      image_width_ratio = 0.5,           -- width as % of editor columns
      image_height_ratio = 0.5,          -- height as % of editor lines
      image_provider    = "placeholders",-- "placeholders" for kitty/ghostty,
                                          -- use "image" if you have image.nvim

      -----------------------------------------------------------------
      -- Cell handling (used by :PyreplSendCell, StepCell, …)
      -----------------------------------------------------------------
      -- By default cells are separated by a line that starts with “# %%”.
      -- You can also supply a function that returns a pattern per‑filetype.
      -- cell_pattern = "^# %%%%.*$",
      cell_pattern = "^```.*$",

      -----------------------------------------------------------------
      -- Python / Jupyter kernel
      -----------------------------------------------------------------
      python_path      = "python",       -- interpreter to launch the REPL
                                          -- (will honour `g:python3_host_prog` if set)
      preferred_kernel = "python3",      -- shown first in the kernel picker
      jupytext_hook    = false,           -- automatic notebook↔script conversion
    })

    -----------------------------------------------------------------
    -- 2️⃣  Convenience keymaps (feel free to remap)
    -----------------------------------------------------------------
    local py = require("pyrepl")

    local function run_all_cells()
      local pattern = "^```.*$"

      -- 1️⃣ Move to the start of the file
      vim.cmd("normal! gg")

      -- 2️⃣ Find the first cell.  If none exists we are done.
      local first = vim.fn.search(pattern, "W")
      if first == 0 then
        vim.notify("[pyrepl] No cells found in the buffer", vim.log.levels.WARN)
        return
      end

      -- 3️⃣ Loop: send the current cell, then jump to the next one.
      while true do
        py.send_cell()

        local nxt = vim.fn.search(pattern, "W")
        if nxt == 0 then
          break
        else
          vim.cmd("normal! " .. nxt .. "G0")
        end
      end

      vim.notify("[pyrepl] All cells sent to REPL", vim.log.levels.INFO)
    end
    vim.keymap.set("n", "<leader>ja", run_all_cells, { desc = "Run all py cells"})

    -- REPL UI
    -- vim.keymap.set("n", "<leader>jo", py.open_repl,          { desc = "Open pyrepl REPL" })
    -- vim.keymap.set("n", "<leader>jh", py.hide_repl,         { desc = "Hide pyrepl REPL" })
    vim.keymap.set("n", "<leader>jc", py.close_repl,        { desc = "Close pyrepl REPL" })
    vim.keymap.set("n", "<leader>jt", py.toggle_repl,       { desc = "Toggle pyrepl REPL" })
    vim.keymap.set("n", "<leader>ji", py.open_image_history, { desc = "Open image history" })
    -- vim.keymap.set({ "n", "t" }, "<C-j>", py.toggle_repl_focus, { desc = "Toggle REPL focus" })

    -- Sending code
    vim.keymap.set("n", "<leader>jb", py.send_buffer,      { desc = "Send buffer to REPL" })
    vim.keymap.set("n", "<leader>jl", py.send_cell,        { desc = "Send current cell to REPL" })
    vim.keymap.set("v", "<leader>jv", py.send_visual,      { desc = "Send visual selection to REPL" })

    -- Cell navigation (optional, but handy)
    vim.keymap.set("n", "<leader>jp", py.step_cell_backward, { desc = "Previous cell" })
    vim.keymap.set("n", "<leader>jo", function()
        py.step_cell_backward()
        py.step_cell_backward()
    end, { desc = "Double Prev cell"})
    vim.keymap.set("n", "<leader>jn", py.step_cell_forward,  { desc = "Next cell" })
    vim.keymap.set("n", "<leader>jm", function()
        py.step_cell_forward()
        py.step_cell_forward()
    end, {desc = "Double Next cell"})
    -- Jupytext helpers
    vim.keymap.set("n", "<leader>je", py.export_to_notebook, { desc = "Export buffer → notebook" })
    -- vim.keymap.set("n", "<leader>js", function()
    --   -- Prompt the user for the tool (pip or uv)
    --   vim.ui.select({ "pip", "uv" }, { prompt = "Install REPL packages with:" },
    --     function(choice)
    --       if choice then py.install_packages(choice) end
    --     end)
    -- end, { desc = "Install REPL runtime packages" })
  end,
}
