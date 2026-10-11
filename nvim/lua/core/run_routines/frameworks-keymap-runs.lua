local M = {}
local env_loaded = false

local function load_env()
  if not env_loaded then
    local ok, dotenv = pcall(require, "dotenv")
    if ok then
      dotenv.command()
      env_loaded = true
    end
  end
end

function M.run_ppgolmes()
  load_env()

  local Terminal = require('toggleterm.terminal').Terminal
  local python_term = Terminal:new({
    direction = "float",
    display_name = "PPGolmes",
    close_on_exit = false,
    count=11,
    hidden = false,
  })
  python_term:toggle()
  python_term:send("python " .. "PPGolmes/main.py", true)
end

function M.run_pipeline()
  load_env()

  local Terminal = require('toggleterm.terminal').Terminal
  local python_term = Terminal:new({
    direction = "horizontal",
    display_name = "Experimentation",
    close_on_exit = true,
    count=11,
    hidden = false,
  })
  python_term:toggle()
  python_term:send("clear && python " .. "run_pipelines/base_architecture_hr_models.py", true)
end

function M.frameworks_run()
  load_env()
  local absolute_filepath = vim.fn.expand("%:p")
  -- vim.env.PATH =  :
  vim.env.PATH = vim.env.PATH .. ':' .. vim.uv.cwd()
  local Terminal = require('toggleterm.terminal').Terminal
  local python_term = Terminal:new({
    direction = "horizontal",
    display_name = "Experimentation",
    close_on_exit = true,
    count=11,
    hidden = false,
  })
  python_term:toggle()
  python_term:send("clear && python " .. absolute_filepath, true)
  -- vim.cmd('!python %')
end

vim.keymap.set("n", "<leader>f4", function()
  M.run_ppgolmes()
end, {desc = "PPGolmes"}
)


vim.keymap.set("n", "<leader>f1", function()
  M.run_pipeline()
end, {desc = "Run Base Experimentation"}
)

vim.keymap.set("n", "<leader>frun", function()
  M.frameworks_run()
end, {desc = "Run current script"})
return M
