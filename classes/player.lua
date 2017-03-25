Player = class {}

function Player:init(name, color, screenPosition)
  self.name = name
  self.color = color
  self.screenPosition = screenPosition
  self:initPosition()
  self.paddle = Paddle(self.center, color, screenPosition)
end

function Player:initPosition()
  if self.screenPosition == C.positionTopLeft then
    self.center = vector(80, 80)
  elseif self.screenPosition == C.positionTopRight then
    self.center = vector(love.graphics.getWidth() - 80, 80)
  elseif self.screenPosition == C.positionBottomLeft then
    self.center = vector(80, love.graphics.getHeight() - 80)
  elseif self.screenPosition == C.positionBottomRight then
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
