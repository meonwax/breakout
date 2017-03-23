Ball = class {}

Ball.speed = 200
Ball.radius = 5

function Ball:init(position)
  self.velocity = vector(-2, -1)
  self.shape = HC.circle(position.x, position.y, Ball.radius)
end

function Ball:update(dt)
  local collisions = HC.collisions(self.shape)
  for otherShape, separatingVector in pairs(collisions) do
    print(string.format("Collision. Separating vector = (%s,%s)", separatingVector.x, separatingVector.y))
    self.velocity = vector(separatingVector.x, separatingVector.y)
  end
  self.shape:move((self.velocity * dt * Ball.speed):unpack())
end

function Ball:draw()
  love.graphics.setColor(colors.brown)
  self.shape:draw('fill')
end
