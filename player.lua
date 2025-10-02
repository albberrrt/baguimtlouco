local accelerate = require("modules.physics").accelerate

local player = {
  width = 50,
  height = 50,
  x = love.graphics.getWidth() / 2 - 50 / 2,
  y = love.graphics.getHeight() / 2 - 50 / 2,

  vel_x = 0,
  acceleration = 1300,
  max_speed = 300,
  friction = 1700,
  dir = 1, -- -1: left, 1: right
}

function player:update(dt)
  local speed = math.abs(self.vel_x)
  local move_dir = self.vel_x > 0 and 1 or -1
  -- input
  local left = love.keyboard.isDown("left")
  local right = love.keyboard.isDown("right")

  if left and not right then
    self.dir = -1
    accelerate(self, dt)
  elseif right and not left then
    self.dir = 1
    accelerate(self, dt)
  else
    -- apply friction
    if self.vel_x ~= 0 then
      local new_vel = speed - self.friction * dt
      if new_vel < 0 then new_vel = 0 end
      self.vel_x = new_vel * move_dir
    end
  end

  self.x = self.x + self.vel_x * dt
end

function player:draw()
  love.graphics.setColor(1, 1, 1)
  love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

return player
