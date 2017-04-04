-- Global includes
lume = require "libs.lume.lume"
class = require "libs.hump.class"
vector = require "libs.hump.vector"
HC = require "libs.hardoncollider"
grease = require "libs.misc.grease.grease"
colors = require "utils.colors"
C = require "utils.constants"

-- Classes
require "classes.playfield"
require "classes.player"
require "classes.paddle"
require "classes.ball"

local port = 6001

local center = vector(love.graphics.getWidth() / 2, love.graphics.getHeight() / 2)
local mousePlayer = 1
local playfield
local players = {}
local ball
local server

function love.load()
  initServer()
  initMouse()
  playfield = Playfield()
  createPlayers()
  ball = Ball(center)
  local startSound = love.audio.newSource("sfx/pacman-intro.mp3", "stream")
  love.audio.play(startSound)
end

function initServer()
  server = grease.udpServer()
  server.handshake = "handshake"
  server.callbacks.connect = onConnect
  server.callbacks.disconnect = onDisconnect
  server.callbacks.recv = onReceive
  server:listen(port)
end

function onConnect(id)
  print("Client " .. id .. " connected")
end

function onDisconnect(id)
  print("Client " .. id .. " disconnected")
end

function onReceive(data, id)
  print("Received data from " .. id .. ":")
  print(data)
end

function initMouse()
  love.mouse.setPosition(center:unpack())
  love.mouse.setGrabbed(true)
  love.mouse.setVisible(false)
end

function createPlayers()
  lume.push(players, Player("Evil", colors.green, C.positionTopLeft))
  lume.push(players, Player("Ugly", colors.yellow, C.positionTopRight))
  lume.push(players, Player("Noisy", colors.blue, C.positionBottomLeft))
  lume.push(players, Player("Vulgar", colors.red, C.positionBottomRight))
end

function love.update(dt)
  server:update(dt)
  playfield:update(dt)
  lume.each(players, "update", dt)
  ball:update(dt)
end

function love.draw()
  playfield:draw()
  lume.each(players, "draw")
  ball:draw()
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
