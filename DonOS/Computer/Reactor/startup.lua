buffer = 10000000
br = peripheral.wrap(DonWrap.wrap(DonWrapList.reactor))
rednet.open(DonWrap.wrap(DonWrapList.modem))
print("Reactor Control V2 By DonF")
shell.run("DonOS/Computer/Reactor/turnOff")


function reactor()
	energy = br.getEnergyStored()
	rod = energy / buffer * 100
	br.setAllControlRodLevels(rod)
	sleep(2)
end

function net()
	local id,msg,pro = rednet.receive()
	if(id == DonRednetRef.pocket1 or id == DonRednetRef.pocket2 and msg == "toggle") then
		if(br.getActive()) then
			shell.run("DonOS/Computer/Reactor/turnOff")
		else
			shell.run("DonOS/Computer/Reactor/turnOn")
		end
	end
end

while true do
	parallel.waitForAny(reactor,net)
end
