-- Global includes
lume = require "libs.lume.lume"
Class = require "libs.hump.class"
Colors = require "utils.colors"

-- Classes
require "classes.paddle"

local center = {x = love.graphics.getWidth() / 2, y = love.graphics.getHeight() / 2}
local mousePlayer = 1
local paddles = {}

function love.load()
  initMouse()
  createPlayers()
end

function initMouse()
  love.mouse.setPosition(center.x, center.y)
  love.mouse.setGrabbed(true)
  love.mouse.setVisible(false)
end

function createPlayers()
  lume.push(paddles, Paddle(100, 20, Colors.green, Paddle.positionTopLeft, "Paddle One"))
  lume.push(paddles, Paddle(100, 20, Colors.yellow, Paddle.positionTopRight, "Paddle Two"))
  lume.push(paddles, Paddle(100, 20, Colors.blue, Paddle.positionBottomLeft, "Paddle Three"))
  lume.push(paddles, Paddle(100, 20, Colors.red, Paddle.positionBottomRight, "Paddle Four"))
end

function love.update(dt)
  lume.each(paddles, "update", dt)
  print("mousePlayer: " .. mousePlayer)
end

function love.draw()
  lume.each(paddles, "draw")
end

function love.mousemoved(x, y, dx, dy, istouch)
  local value = lume.round((x - center.x) / center.x * 100)
  paddles[mousePlayer]:updatePosition(value)
end

function love.mousereleased(x, y, button, istouch)
  mousePlayer = mousePlayer % #paddles + 1
end

function love.keypressed(key, scanCode, isRepeat)
  if key == "escape" then
    love.event.quit()
  end
end
