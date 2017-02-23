Paddle = Class {}

function Paddle:init(center, color)
  self.dim = {width = 100, height = 20}
  self.color = color
  self.center = center
  self.controllerValue = 0
end

function Paddle:updatePosition(value)
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

  -- Rotate coordinate system according to the controller value
  love.graphics.rotate(self.controllerValue * math.pi / 180)

  -- Paddle padding from the player's center
  local padding = 100
  love.graphics.rectangle("fill", -self.dim.width / 2, -self.dim.height / 2 + padding, self.dim.width, self.dim.height)

  -- Reset coordinate system
  love.graphics.origin()
end
