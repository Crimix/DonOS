os.loadAPI("DonOS/api/DonButtonAPI")
os.loadAPI("DonOS/Ref/DonRednetRef")
local reactorState = true

function reactor()
	if(reactorState) then
		rednet.send(DonRednetRef.reactor,"turnOn")
		reactorState = false
	else
		rednet.send(DonRednetRef.reactor,"turnOff")
		reactorState = true
	end
end
function update()
	shell.run("DonOS/update")
end

function tab()
	shell.run("fg ")
end

function setButtons()
	DonButtonAPI.set("Reactor",reactor,2,2,false,"toggle")
	DonButtonAPI.set("Update",update,2,4,false,"single")
	DonButtonAPI.set("shell",tab,2,6,false,"single")
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