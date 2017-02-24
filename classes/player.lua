Player = class {}

-- Constants for position on screen
Player.positionBottomRight = 1
Player.positionBottomLeft = 2
Player.positionTopLeft = 3
Player.positionTopRight = 4

function Player:init(name, color, screenPosition)
  self.name = name
  self.color = color
  self.screenPosition = screenPosition
  self:initPosition()
  self.paddle = Paddle(self.center, color, screenPosition)
end

function Player:initPosition()
  if self.screenPosition == Player.positionTopLeft then
    self.center = vector(80, 80)
  elseif self.screenPosition == Player.positionTopRight then
    self.center = vector(love.graphics.getWidth() - 80, 80)
  elseif self.screenPosition == Player.positionBottomLeft then
    self.center = vector(80, love.graphics.getHeight() - 80)
  elseif self.screenPosition == Player.positionBottomRight then
    self.center = vector(love.graphics.getWidth() - 80, love.graphics.getHeight() - 80)
  else
    error("screenPosition value invalid")
  end
end

function Player:inputchanged(value)
  self.paddle:inputchanged(value)
end

function Player:update(dt)
  self.paddle:update(dt)
end

function Player:draw()
  love.graphics.setColor(self.color)
  love.graphics.circle("fill", self.center.x, self.center.y, 50)

  love.graphics.setColor(colors.black)
  love.graphics.print(self.name, self.center:unpack())

  self.paddle:draw()
end
