grease = require "grease"

local client
local ip = "127.0.0.1"
local port = 6001

function love.load()
  client = grease.udpClient()
  client.handshake = "handshake"
  client.callbacks.recv = dataReceived
  print("Connecting to UDP server " .. ip .. ":" .. port)
  client:connect(ip, port, false)
end

function love.update(dt)
  client:update(dt)
end

function love.draw()
end

function love.keypressed(key, scanCode, isRepeat)
  if key == "escape" then
    love.event.quit()
  end
  client:send(key)
end

function dataReceived(data)
  print("Received data: " .. data)
end

function love.quit()
  print("Disconnecting from " .. ip .. ":" .. port)
  client:disconnect()
end
