Paddle = Class {}

-- Constants for position on screen
Paddle.positionTopLeft = 1
Paddle.positionTopRight = 2
Paddle.positionBottomLeft = 3
Paddle.positionBottomRight = 4

function Paddle:init(width, height, color, screenPosition, name)
  self.name = name
  self.dim = {width = width, height = height}
  self.color = color
  self.screenPosition = screenPosition
  self:initPosition()
  self.controllerValue = 0
end

function Paddle:initPosition()
  if self.screenPosition == Paddle.positionTopLeft then
    self.position = {x = 80, y = 80}
  elseif self.screenPosition == Paddle.positionTopRight then
    self.position = {x = love.graphics.getWidth() - 80 - self.dim.width, y = 80}
  elseif self.screenPosition == Paddle.positionBottomLeft then
    self.position = {x = 80, y = love.graphics.getHeight() - 80 - self.dim.height}
  elseif self.screenPosition == Paddle.positionBottomRight then
    self.position = {x = love.graphics.getWidth() - 80 - self.dim.width, y = love.graphics.getHeight() - 80 - self.dim.height}
  else
    error("screenPosition value invalid")
  end
end

function Paddle:updatePosition(value)
  assert(value >= -100 and value <= 100, "Value has to be within -100 and +100")
  self.controllerValue = value
end

function Paddle:update(dt)
end

function Paddle:draw()
  love.graphics.setColor(self.color)
  -- love.graphics.print(self.name .. " x: " .. self.position.x .. " y: " .. self.position.y, self.position.x, self.position.y)


  love.graphics.translate(self.position.x, self.position.y) -- move relative (0,0) to (x,y)
  love.graphics.rotate(self.controllerValue * math.pi / 180) -- rotate coordinate system around relative (0,0) (absolute (x,y))
  love.graphics.rectangle("fill", -self.dim.width / 2 + self.controllerValue, -self.dim.height / 2, self.dim.width, self.dim.height) -- draw rectangle centered around relative (0,0)


  -- love.graphics.rectangle("fill", self.position.x + self.controllerValue, self.position.y, self.dim.width, self.dim.height)

  -- Reset coordinate system
  love.graphics.origin()
end
