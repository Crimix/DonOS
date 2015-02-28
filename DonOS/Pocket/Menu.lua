local dataList ={}

function reactor()
	rednet.send(DonRednetRef.reactor,"toggle")
end
function update()
	shell.run("DonOS/update")
end

function refresh()
	term.clear()
	term.setCursorPos(1,1)
	print("Plz wait")
	dataList["sId"] = os.computerID()
	dataList["rId"] = DonRednetRef.main
	dataList["msg"] = "refresh"
	msg = textutils.serialize(dataList)
	rednet.send(DonRednetRef.sat,msg)
	local id,msg,pro = rednet.receive(10)
	if(id == nil) then
		print("error")
	else
		data = textutils.unserialize(msg)
		if(data["msg"] == "refresh") then
			DonButtonAPI.setList(data["data"])
		end
	end
	term.clear()
end

function tab()
	shell.run("fg ")
end

function setButtons()
	DonButtonAPI.set("Reactor",reactor,2,2,false,"toggle")
	DonButtonAPI.set("Update",update,2,4,false,"single")
	DonButtonAPI.set("Shell",tab,2,6,false,"single")
	DonButtonAPI.set("Refresh",refresh,4,20,false,"single")
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