local lg = love.graphics
local player = require("player")
local camera = require("camera")

function love.load()
  lg.setBackgroundColor(52 / 255, 76 / 255, 235 / 255)
  lg.setFont(lg.newFont(12))
end

function love.update(dt)
  if dt > 0.033 then dt = 0.033 end
  player:update(dt)
  camera:update(player)

  if love.keyboard.isDown("escape") then
    love.event.quit()
  end
end

function love.draw()
  camera:draw()

  player:draw()

  camera:clear()

  -- Debug
  love.graphics.print("Input direction: " .. player.dir .. " Speed: " .. math.floor(math.abs(player.vel_x)), 10, 10)
end
