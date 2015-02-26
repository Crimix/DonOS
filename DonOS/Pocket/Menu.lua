os.loadAPI("DonOS/api/DonButtonAPI")

function reactor()
	rednet.send(1,"turnOn")
end


function setButtons()
	DonButtonAPI.set("Reactor",reactor,3,2,false,false)
end

function main()
	setButtons()
	DonButtonAPI.update()
	while true do
		local event, x, y = os.pullEvent("mouse_click")
		DonButtonAPI.getButton(x,y)
	end
end

main()