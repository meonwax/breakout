io.stdout:setvbuf("no") -- Make the console output display live print() messages

function love.conf(t)
  t.title = "4 Player Breakout"
  t.version = "0.10.2"

  t.window.width = 1280
  t.window.height = 800
  t.window.icon = "icon.png"

  -- Disable some modules
  t.modules.physics = false
  t.modules.touch = false
  t.modules.thread = false
end
