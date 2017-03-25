Ball = class {}

Ball.speed = 500
Ball.radius = 15

function Ball:init(position)
  self.direction = vector(-2, -1):normalized() -- Set initial direction
  self.shape = HC.circle(position.x, position.y, Ball.radius)
  self.sfx = {}
  self.sfx.borderHit = love.audio.newSource("sfx/border-hit.wav", "static")
  self.sfx.paddleHit = love.audio.newSource("sfx/paddle-hit.wav", "static")
end

function Ball:update(dt)
  local collisions = HC.collisions(self.shape)
  for otherShape, separatingVector in pairs(collisions) do
    self.direction = self:calculateReflectionVector(separatingVector)
    self:playSound(otherShape)
    break
  end
  self.shape:move((self.direction * dt * Ball.speed):unpack())
end

-- See http://math.stackexchange.com/questions/13261/how-to-get-a-reflection-vector
function Ball:calculateReflectionVector(separatingVector)
  local normalizedSeparatingVector = vector(separatingVector.x, separatingVector.y):normalized()
  return self.direction - 2 * (self.direction * normalizedSeparatingVector) * normalizedSeparatingVector
end

function Ball:draw()
  love.graphics.setColor(colors.brown)
  self.shape:draw('fill')
end

function Ball:playSound(otherShape)
  if otherShape.type == "paddle" then
    love.audio.play(self.sfx.paddleHit)
  end
  love.audio.play(self.sfx.borderHit)
end
