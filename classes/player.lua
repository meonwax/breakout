Player = Class {}

-- Constants for position on screen
Player.positionTopLeft = 1
Player.positionTopRight = 2
Player.positionBottomLeft = 3
Player.positionBottomRight = 4

function Player:init(name, color, screenPosition)
  self.name = name
  self.color = color
  self.screenPosition = screenPosition
  self:initPosition()
  self.paddle = Paddle(self.center, color)
end

function Player:initPosition()
  if self.screenPosition == Player.positionTopLeft then
    self.center = {x = 80, y = 80}
  elseif self.screenPosition == Player.positionTopRight then
    self.center = {x = love.graphics.getWidth() - 80, y = 80}
  elseif self.screenPosition == Player.positionBottomLeft then
    self.center = {x = 80, y = love.graphics.getHeight() - 80}
  elseif self.screenPosition == Player.positionBottomRight then
    self.center = {x = love.graphics.getWidth() - 80, y = love.graphics.getHeight() - 80}
  else
    error("screenPosition value invalid")
  end
end

function Player:updatePosition(value)
  self.paddle:updatePosition(value)
end

function Player:update(dt)
  self.paddle:update(dt)
end

function Player:draw()
  love.graphics.setColor(self.color)
  love.graphics.circle("fill", self.center.x, self.center.y, 30)
  --love.graphics.print(self.name .. " x: " .. self.center.x .. " y: " .. self.center.y, self.center.x, self.center.y)
  self.paddle:draw()
end
