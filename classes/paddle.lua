Paddle = class {}

function Paddle:init(center, color, screenPosition)
  self.dim = {width = 100, height = 20}
  self.center = center
  self.screenPosition = screenPosition
  self.color = color
  self.controllerValue = 0
end

function Paddle:inputchanged(value)
  assert(value >= -100 and value <= 100, "Value has to be within -100 and +100")
  self.controllerValue = value
  print("controllerValue: " .. self.controllerValue)
end

function Paddle:update(dt)
end

function Paddle:draw()
  love.graphics.setColor(self.color)

  -- Move coordinate system root to the player's center
  love.graphics.translate(self.center.x, self.center.y)

  -- Calculate the specific rotation addition dependening on the screen position
  local positionRotation = 90 * self.screenPosition

  -- The rotation in degrees according to the controller value
  local degrees = ((self.controllerValue + positionRotation) + 45)

  -- Rotate coordinate system
  love.graphics.rotate(degrees * math.pi / 180)

  -- Paddle padding from the player's center
  local padding = 150

  -- Actually draw the paddle
  love.graphics.rectangle("fill", -self.dim.width / 2, -self.dim.height / 2 + padding, self.dim.width, self.dim.height)

  -- Reset coordinate system
  love.graphics.origin()
end

