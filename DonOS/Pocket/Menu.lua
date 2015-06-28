local dataListM ={}

function reactor()
	dataListM ={}
	dataListM["sId"] = os.computerID()
	dataListM["rId"] = "reactor"
	dataListM["msg"] = "toggle"
	msg = textutils.serialize(dataListM)
	rednet.send(DonRednetRef.sat,msg)
end
function update()
	shell.run("DonOS/update")
end

function refresh()
	dataListM ={}
	term.clear()
	term.setCursorPos(1,1)
	print("Plz wait")
	dataListM["sId"] = os.computerID()
	dataListM["rId"] = "main"
	dataListM["msg"] = "refresh"
	msg = textutils.serialize(dataListM)
	rednet.send(DonRednetRef.sat,msg)
	local id,msg,pro = rednet.receive()
	data = textutils.unserialize(msg)
	if(data["msg"] == "refresh") then
		DonButtonAPI.setList(data["data"])
	end
	term.clear()
	start()
	DonButtonAPI.update()
end

function tab()
	shell.run("fg ")
end

function setButtons()
	DonButtonAPI.set("Reactor",reactor,2,2,false,"toggle")
	DonButtonAPI.set("Update",update,2,4,false,"single")
	DonButtonAPI.set("Shell",tab,2,6,false,"single")
	DonButtonAPI.set("Refresh",refresh,4,18,false,"single")
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