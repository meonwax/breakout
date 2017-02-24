Ball = class {}

function Ball:init(position)
  self.position = position
  self.velocity = vector(-200, -100)
end

function Ball:update(dt)
  self.position = self.position + self.velocity * dt
end

function Ball:draw()
  print("Ball position: " .. tostring(self.position))
  love.graphics.setColor(colors.brown)
  love.graphics.circle("fill", self.position.x, self.position.y, 5)
end
