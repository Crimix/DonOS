buffer = 10000000
br = peripheral.wrap(DonWrap.wrap(DonWrapList.reactor))
rednet.open(DonWrap.wrap(DonWrapList.modem))
print("Reactor Control V3 By DonF")
shell.run("DonOS/Computer/Reactor/turnOff")


function reactor()
	energy = br.getEnergyStored()
	rod = energy / buffer * 100
	br.setAllControlRodLevels(rod)
	sleep(2)
end

function net()
	local id,msg,pro = rednet.receive()
	data = textutils.unserialize(msg)
	if(data["msg"] == "toggle") then
		if(br.getActive()) then
			shell.run("DonOS/Computer/Reactor/turnOff")
		else
			shell.run("DonOS/Computer/Reactor/turnOn")
		end
	end
end


function register()
	dataList ={}
	dataList["sId"] = os.computerID()
	dataList["rId"] = "reactor"
	dataList["msg"] = "type"
	rData = textutils.serialize(dataList)
	rednet.broadcast(rData)
end


if(fs.exists("temp/id")) then
else
	register()
	fs.open("temp/id","w")
end
while true do
	parallel.waitForAny(reactor,net)
end
