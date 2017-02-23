-- Global includes
lume = require "libs.lume.lume"
Class = require "libs.hump.class"
Colors = require "utils.colors"

-- Classes
require "classes.player"
require "classes.paddle"

local center = {x = love.graphics.getWidth() / 2, y = love.graphics.getHeight() / 2}
local mousePlayer = 1
local players = {}

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
  lume.push(players, Player("Evil", Colors.green, Player.positionTopLeft))
  lume.push(players, Player("Ugly", Colors.yellow, Player.positionTopRight))
  lume.push(players, Player("Noisy", Colors.blue, Player.positionBottomLeft))
  lume.push(players, Player("Vulgar", Colors.red, Player.positionBottomRight))
end

function love.update(dt)
  lume.each(players, "update", dt)
end

function love.draw()
  lume.each(players, "draw")
end

function love.mousemoved(x, y, dx, dy, istouch)
  local value = lume.round((x - center.x) / center.x * 100)
  players[mousePlayer]:updatePosition(value)
end

function love.mousereleased(x, y, button, istouch)
  mousePlayer = mousePlayer % #players + 1
  print("mousePlayer: " .. mousePlayer)
end

function love.keypressed(key, scanCode, isRepeat)
  if key == "escape" then
    love.event.quit()
  end
end
