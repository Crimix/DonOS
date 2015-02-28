buffer = 10000000
os.loadAPI("DonOS/Ref/DonRednetRef")
os.loadAPI("DonOS/Ref/DonWrapList")
os.loadAPI("DonOS/Helpers/DonWrap")
br = peripheral.wrap(DonWrap.wrap(DonWrapList.reactor))
DonWrap.wrap(DonWrapList.modem)
print("Reactor Control V2 By DonF")
shell.run("DonOS/Computer/Reactor/turnOff")


function reactor()
	energy = br.getEnergyStored()
	rod = energy / buffer * 100
	br.setAllControlRodLevels(rod)
	sleep(2)
end

function rednet()
	pocket1 = DonRednetRef.pocket1
	pocket2 = DonRednetRef.pocket2
	local id,msg,pro = rednet.receive(2)
	if ((id = pocket1) or (id = pocket2)) then
		shell.run("DonOS/Computer/Reactor/"..msg)
	end
end

parallel.waitForAny(reactor,rednet)

