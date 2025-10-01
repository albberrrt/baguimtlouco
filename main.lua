function love.load()
  width, height = 50, 50
  x, y = love.graphics.getWidth() / 2 - width / 2, love.graphics.getHeight() / 2 - height / 2
  speed = 0
  acceleration = 0.1
  maxSpeed = 5
  direction = 0       -- -1: left, 1: right, 0: idle
  facingDirection = 1 -- -1: left, 1: right
  love.graphics.setBackgroundColor(52 / 255, 76 / 255, 235 / 255)
end

function love.update(dt)
  if love.keyboard.isDown("right") then
    direction = 1
    if speed <= maxSpeed then
      speed = speed + acceleration
    end
    -- x = x + speed
  end
  if love.keyboard.isDown("left") then
    direction = -1
    if speed <= maxSpeed then
      speed = speed + acceleration
    end
    -- x = x - speed
  end
  if not love.keyboard.isDown("right") and not love.keyboard.isDown("left") then
    if speed > 0 then
      direction = direction -- maintain direction while slowing down
      speed = speed - (acceleration)
    end
    if speed == 0 then
      direction = 0
    end
  end
  x = x + (speed * direction)

  if x <= 0 or x >= 750 then          -- 750 is 800 (window width) - 50 (rectangle width)
    x = math.max(0, math.min(x, 750)) -- Clamp x between 0 and 750
    speed = 0
  end
  if speed < 0 then
    speed = 0
  end
end

function love.draw()
  love.graphics.setColor(1, 1, 1)
  love.graphics.rectangle("fill", x, y, width, height)

  love.graphics.print("Direction: " .. direction .. " Speed: " .. speed, 10, 10)
end
