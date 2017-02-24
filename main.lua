-- Global includes
lume = require "libs.lume.lume"
class = require "libs.hump.class"
vector = require "libs.hump.vector"
colors = require "utils.colors"

-- Classes
require "classes.player"
require "classes.paddle"
require "classes.ball"

local center = vector(love.graphics.getWidth() / 2, love.graphics.getHeight() / 2)
local mousePlayer = 1
local players = {}

function love.load()
  initMouse()
  createPlayers()
end

function initMouse()
  love.mouse.setPosition(center:unpack())
  love.mouse.setGrabbed(true)
  love.mouse.setVisible(false)
end

function createPlayers()
  lume.push(players, Player("Evil", colors.green, Player.positionTopLeft))
  lume.push(players, Player("Ugly", colors.yellow, Player.positionTopRight))
  lume.push(players, Player("Noisy", colors.blue, Player.positionBottomLeft))
  lume.push(players, Player("Vulgar", colors.red, Player.positionBottomRight))
end

function love.update(dt)
  lume.each(players, "update", dt)
end

function love.draw()
  lume.each(players, "draw")
end

function love.mousemoved(x, y, dx, dy, istouch)
  local value = lume.round((x - center.x) / center.x * 100)
  players[mousePlayer]:inputchanged(value)
end

-- Only for testing
function love.mousereleased(x, y, button, istouch)
  love.mouse.setPosition(center:unpack())
  mousePlayer = mousePlayer % #players + 1
  print("mousePlayer: " .. mousePlayer)
end

function love.keypressed(key, scanCode, isRepeat)
  if key == "escape" then
    love.event.quit()
  end
end
