Ball = class {}

function Ball:init(position)
  self.position = position
  self.radius = 5
  self.velocity = vector(-200, -100)
end

function Ball:update(dt)
  self.position = self.position + self.velocity * dt
end

function Ball:draw()
  -- print("Ball position: " .. tostring(self.position))
  love.graphics.setColor(colors.brown)
  love.graphics.circle("fill", self.position.x, self.position.y, self.radius)
end
