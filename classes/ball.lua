Ball = class {}

Ball.speed = 500
Ball.radius = 5

function Ball:init(position)
  self.direction = vector(-2, -1):normalized() -- Set initial direction
  self.shape = HC.circle(position.x, position.y, Ball.radius)
end

function Ball:update(dt)
  local collisions = HC.collisions(self.shape)
  for otherShape, separatingVector in pairs(collisions) do
    self.direction = vector(separatingVector.x, separatingVector.y):normalized()
  end
  self.shape:move((self.direction * dt * Ball.speed):unpack())
end

function Ball:draw()
  love.graphics.setColor(colors.brown)
  self.shape:draw('fill')
end
