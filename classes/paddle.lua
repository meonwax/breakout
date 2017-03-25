Paddle = class {}

Paddle.padding = 80

function Paddle:init(playerCenter, color, screenPosition)
  self.dim = {width = 100, height = 20}
  self.screenPosition = screenPosition
  self.playerCenter = playerCenter
  self:initPosition()
  self.color = color
  self.controllerValue = 0
  self.shape = HC.rectangle(self.position.x, self.position.y, self.dim.width, self.dim.height)
  self.shape.type = "paddle"
end

function Paddle:initPosition()
  self.position = self.playerCenter + vector(-self.dim.width / 2, Paddle.padding)
end

function Paddle:inputchanged(value)
  assert(value >= -100 and value <= 100, "Value has to be within -100 and +100")
  self.controllerValue = value
  -- print("controllerValue: " .. self.controllerValue)
  self.shape:setRotation(self:getRotation(), self.playerCenter:unpack())
end

function Paddle:update(dt)
end

function Paddle:getRotation()
  -- Calculate the specific rotation addition dependening on the screen position
  local positionRotation = 90 * self.screenPosition

  -- The rotation in degrees according to the controller value
  local degrees = ((self.controllerValue + positionRotation) + 45)

  -- Calculate rotation in radians
  return math.rad(degrees)
end

function Paddle:draw()
  love.graphics.setColor(self.color)
  self.shape:draw('fill')
end
