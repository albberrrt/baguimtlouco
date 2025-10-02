function accelerate(obj, dt)
  obj.vel_x = obj.vel_x + (obj.acceleration * obj.dir * dt)
  obj.vel_x = math.max(-obj.max_speed, math.min(obj.vel_x, obj.max_speed)) -- clamp speed
end

return {
  accelerate = accelerate
}
