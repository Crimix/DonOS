buffer = 10000000
os.loadAPI("DonOS/Ref/DonRednetRef")
os.loadAPI("DonOS/Ref/DonWrapList")
os.loadAPI("DonOS/Helpers/DonWrap")
br = DonWrap.wrap(DonWrapList.reactor)
print("Reactor Control V2 By DonF")
shell.run("DonOS/Computer/Reactor/turnOff")


function reactor()
	energy = br.getEnergyStored()
	rod = energy / buffer * 100
	br.setAllControlRodLevels(rod)
	sleep(2)
end

function rednet()
	local id,msg,pro = rednet.receive(2)
	if(id = DonRednetRef.pocket1 or id = DonRednetRef.pocket2) then
		shell.run("DonOS/Computer/Reactor/"..msg)
	end
end

parallel.waitForAny(reactor,rednet)

