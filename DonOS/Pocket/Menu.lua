os.loadAPI("DonOS/api/DonButtonAPI")

local reactorState = false

function reactor()
	if(reactorState) then
		rednet.send(1,"turnOn")
		reactorState = false
	else
		rednet.send(1,"turnOff")
		reactorState = true
	end
end


function setButtons()
	DonButtonAPI.set("Reactor",reactor,3,2,false,false)
end

function main()
	setButtons()
	DonButtonAPI.update()
	while true do
		local event, side, x, y = os.pullEvent("mouse_click")
		DonButtonAPI.getButton(x,y)
	end
end

main()