Playfield = class {}

Playfield.borderWidth = 5

function Playfield:init()
  self.background = love.graphics.newImage("images/stars.jpg")
  self.borderTop = HC.rectangle(0, 0, love.graphics.getWidth(), Playfield.borderWidth)
  self.borderBottom = HC.rectangle(0, love.graphics.getHeight() - Playfield.borderWidth, love.graphics.getWidth(), Playfield.borderWidth)
  self.borderLeft = HC.rectangle(0, Playfield.borderWidth, Playfield.borderWidth, love.graphics.getHeight() - Playfield.borderWidth * 2)
  self.borderRight = HC.rectangle(love.graphics.getWidth() - Playfield.borderWidth, Playfield.borderWidth, Playfield.borderWidth, love.graphics.getHeight() - Playfield.borderWidth * 2)
end

function Playfield:update(dt)
end

function Playfield:draw()
  self:drawBackground()
  self:drawBorders()
end

function Playfield:drawBorders()
  love.graphics.setColor(colors.darkBlue)
  self.borderTop:draw('fill')
  self.borderBottom:draw('fill')
  self.borderLeft:draw('fill')
  self.borderRight:draw('fill')
end

function Playfield:drawBackground()
  local scaleFactor = love.graphics.getWidth() / self.background:getWidth()
  love.graphics.setColor(255, 255, 255, 255)
  love.graphics.draw(self.background, 0, 0, 0, scaleFactor, scaleFactor)
end
