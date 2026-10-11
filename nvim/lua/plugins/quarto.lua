return {
  -----------------------------------------------------------------
  -- 1️⃣ Quarto core + LSP + cell awareness
  -----------------------------------------------------------------
  {
    "quarto-dev/quarto-nvim",
    dev = false,
    opts = {
      lspFeatures = {
        enabled = true,
        -- chunks = "curly",               -- use {{}} delimiters (default)
        chunks = "all",               -- use {{}} delimiters (default)
        languages = {
            "python",
        }
      },
      codeRunner = {
        enabled = true,
        default_method = "slime",       -- we will swap to "molten" later
      },
      completion = {
          enabled = true,
      },
    },
    dependencies = {
      "jmbuhr/otter.nvim",             -- cell‑level language support
      opts = {
          -- write_to_disk = true,
      }
    },

    config = function(_, opts)
      require("quarto").setup(opts)
      local function pdf_preview()
        vim.cmd("silent write")
        local buffer_path = vim.api.nvim_buf_get_name(0)
        vim.system({'quarto', 'render', buffer_path, '-t', 'pdf', '-M', 'code-fold:false' }, {}, function(obj)
            if obj.code ~= 0 then
              vim.schedule(function()
                  vim.notify(obj.stderr, vim.log.levels.ERROR)
              end)
              print("quarto failed do render " .. buffer_path)
              return
            end
          end)
        local result = vim.system({'pgrep', 'zathura'}):wait()
        local pdf_file = vim.fn.expand("%:p:r") .. ".pdf"

        if result.code ~= 0 then
          vim.system({'zathura', pdf_file})
        end
      end

      local function html_preview()
        vim.cmd("silent write")
        local buffer_path = vim.api.nvim_buf_get_name(0)
        vim.system({'quarto', 'render', buffer_path, '-t', 'html', '-M', 'code-fold:true' }, {}, function(obj)
            if obj.code ~= 0 then
              vim.schedule(function()
                  vim.notify(obj.stderr, vim.log.levels.ERROR)
              end)
              print("quarto failed do render " .. buffer_path)
              return
            end
          end)
        local result = vim.system({'pgrep', 'firefox'}):wait()
        local html_file = vim.fn.expand("%:p:r") .. ".html"

        if result.code ~= 0 then
          vim.system({'firefox', html_file, '&'})
        end
      end

      vim.keymap.set('n', '<leader>qp', pdf_preview, { desc = "pdf quarto preview"})
      vim.keymap.set('n', '<leader>ql', html_preview, { desc = "html quarto preview"})

    end,
    -- keys = {
    --     -- vim.keymap.set("n", "<leader>ml", ":MoltenEvaluateLine<CR>", { desc = "evaluate line", silent = true }),
    -- }
  },

  -----------------------------------------------------------------
  -- 2️⃣ jupytext – edit .ipynb as .qmd (and back)
  -----------------------------------------------------------------
  {
    "GCBallesteros/jupytext.nvim",
    opts = {
      custom_language_formatting = {
        python = {
          extension = "qmd",
          style = "quarto",
          force_ft = "quarto",
        },
        r = {
          extension = "qmd",
          style = "quarto",
          force_ft = "quarto",
        },
      },
    },
  },

  { -- send code from python/r/qmd documets to a terminal or REPL
    -- like ipython, R, bash
    'jpalardy/vim-slime',
    dev = false,
    init = function()
      vim.b['quarto_is_python_chunk'] = false
      Quarto_is_in_python_chunk = function()
        require('otter.tools.functions').is_otter_language_context 'python'
      end

      vim.cmd [[
      let g:slime_dispatch_ipython_pause = 100
      function SlimeOverride_EscapeText_quarto(text)
      call v:lua.Quarto_is_in_python_chunk()
      if exists('g:slime_python_ipython') && len(split(a:text,"\n")) > 1 && b:quarto_is_python_chunk && !(exists('b:quarto_is_r_mode') && b:quarto_is_r_mode)
      return ["%cpaste -q\n", g:slime_dispatch_ipython_pause, a:text, "--", "\n"]
      else
      if exists('b:quarto_is_r_mode') && b:quarto_is_r_mode && b:quarto_is_python_chunk
      return [a:text, "\n"]
      else
      return [a:text]
      end
      end
      endfunction
      ]]

      vim.g.slime_target = 'neovim'
      vim.g.slime_no_mappings = true
      vim.g.slime_python_ipython = 1
    end,
    config = function()
      vim.g.slime_input_pid = false
      vim.g.slime_suggest_default = true
      vim.g.slime_menu_config = false
      vim.g.slime_neovim_ignore_unlisted = true

      local function mark_terminal()
        local job_id = vim.b.terminal_job_id
        vim.print('job_id: ' .. job_id)
      end

      local function set_terminal()
        vim.fn.call('slime#config', {})
      end
      vim.keymap.set('n', '<leader>cm', mark_terminal, { desc = '[m]ark terminal' })
      vim.keymap.set('n', '<leader>cs', set_terminal, { desc = '[s]et terminal' })
    end,
  },
}
