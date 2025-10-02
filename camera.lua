local camera = {
  x = 0,
  y = 0,
}

function camera:update(target)
  self.x = target.x + target.width / 2 - love.graphics.getWidth() / 2
  self.y = target.y + target.height / 2 - love.graphics.getHeight() / 2

  if camera.x < 0 then camera.x = 0 end
  if camera.y < 0 then camera.y = 0 end
end

function camera:draw()
  love.graphics.push()
  love.graphics.translate(-self.x, -self.y)
end

function camera:clear()
  love.graphics.pop()
end

return camera
