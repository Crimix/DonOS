local arg = { ... }
x = tonumber(arg[1])
y = tonumber(arg[2])
 
vx = 1
vy = 1
 
turtle.select(1)
 
function breakBlockX()
while vx <= x-1  do
   while not turtle.forward(1) do
   turtle.dig()
    end
  vx = vx + 1
  end  
 end
 
function breakBlockY()
while vy <= y-1 do
 while not turtle.forward() do
    turtle.dig()
   end
  vy = vy + 1
 end
end
 
breakBlockX()
turtle.turnRight()
breakBlockY()
vx = 1
vy = 1
turtle.turnRight()
breakBlockX()
turtle.turnRight()
breakBlockY()