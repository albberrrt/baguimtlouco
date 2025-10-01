function love.load()
  width, height = 50, 50
  x, y = love.graphics.getWidth() / 2 - width / 2, love.graphics.getHeight() / 2 - height / 2
  love.graphics.setBackgroundColor(52 / 255, 76 / 255, 235 / 255)

  velocity = 0
  speed = 0
  maxSpeed = 5

  input_dir = 1 -- -1: left, 1: right
  acceleration = 0.01
  friction = 0.05
end

function getKeyDirection()
  if love.keyboard.isDown("right") then
    return 1
  elseif love.keyboard.isDown("left") then
    return -1
  else
    return 0
  end
end

function accelerate(dir)
  velocity = velocity + (acceleration * dir)

  if speed > maxSpeed then
    velocity = maxSpeed * input_dir
  end
end

function love.update(dt)
  speed = math.abs(velocity) -- 100 is the proportion factor

  input_dir = getKeyDirection()
  if input_dir ~= 0 then
    accelerate(input_dir)
  end
  -- -- Deceleration
  -- if not love.keyboard.isDown("right") and not love.keyboard.isDown("left") then
  --   if math.abs(speed) > 0 then
  --     speed = speed + (acceleration * -direction)
  --   end
  -- end

  -- -- Clamp position and speed
  -- if x <= 0 or x >= 750 then          -- 750 is 800 (window width) - 50 (rectangle width)
  --   x = math.max(0, math.min(x, 750)) -- Clamp x between 0 and 750
  -- end
end

function love.draw()
  love.graphics.setColor(1, 1, 1)
  love.graphics.rectangle("fill", x, y, width, height)

  love.graphics.print("Input direction: " .. input_dir .. " Speed: " .. speed, 10, 10)
end
