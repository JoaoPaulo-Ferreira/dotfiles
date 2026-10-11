local M = {}

function M.make_and_run()
  local Terminal = require('toggleterm.terminal').Terminal
  local python_term = Terminal:new({
    direction = "horizontal",
    display_name = "Run main.c",
    close_on_exit = true,
    count=11,
    hidden = false,
  })
  python_term:toggle()
  make_cmd = "/home/joao.soares/.local/share/JetBrains/Toolbox/apps/clion/bin/cmake/linux/x64/bin/cmake -DCMAKE_BUILD_TYPE=Debug -DCMAKE_MAKE_PROGRAM=/home/joao.soares/.local/share/JetBrains/Toolbox/apps/clion/bin/ninja/linux/x64/ninja -G Ninja -S /home/joao.soares/Git/hdlpo_model -B /home/joao.soares/Git/hdlpo_model/cmake-build-debug"
make_cmd = "/home/joao.soares/.local/share/JetBrains/Toolbox/apps/clion/bin/cmake/linux/x64/bin/cmake -DCMAKE_BUILD_TYPE=Debug -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DCMAKE_MAKE_PROGRAM=/home/joao.soares/.local/share/JetBrains/Toolbox/apps/clion/bin/ninja/linux/x64/ninja -G Ninja -S /home/joao.soares/Git/hdlpo_model -B /home/joao.soares/Git/hdlpo_model/cmake-build-debug"
  python_term:send("clear", true)
  python_term:send(make_cmd, true)
  python_term:send("./cmake-build-debug/HDLPOLIB", true)
  -- python_term:send("make; clear; ./HDLPOLIB", true)
end


vim.keymap.set("n", "<leader>m1", function()
  M.make_and_run()
end, {desc = "Run main.c"}
)

