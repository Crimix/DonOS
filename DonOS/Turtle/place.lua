local arg = { ... }
 
x = tonumber(arg[1])
y = tonumber(arg[2])
 
vx = 1
vy = 1
 
turtle.select(1)
 
function placeBlockX()
i = 1
while vx <= x-1  do
 if turtle.getItemCount(i) > 1 then
  while not turtle.placeDown() do
      turtle.digDown()
    end
   while not turtle.forward(1) do
   turtle.dig()
  end
   vx = vx + 1
  else
  i = i + 1
  if i == 16 then
  i = 1
  end
  turtle.select(i)
  end
  end  
  end
 
function placeBlockY()
h = 1
while vy <= y-1 do
if turtle.getItemCount(h) > 1 then
  while not turtle.placeDown() do
    turtle.digDown()
   end
  while not turtle.forward() do
    turtle.dig()
   end
   vy = vy + 1
   else
   h = h + 1
   if h == 16 then
   h = 1
   end
   turtle.select(h)
   end
   end
   end
 
turtle.up()
placeBlockX()
turtle.turnRight()
placeBlockY()
vx = 1
vy = 1
turtle.turnRight()
placeBlockX()
turtle.turnRight()
placeBlockY()