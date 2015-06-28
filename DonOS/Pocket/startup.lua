function alias()
	shell.setAlias("update","DonOS/update")
	shell.setAlias("DonHelp","DonOS/commands")
end

function main()
	run = 1
	local event, key1 = os.pullEvent("key")
	print(keys.getName(key1).." + ?")
	local event, key2 = os.pullEvent("key")
	start()
	DonKeyAPI.run(key1,key2)
end

function text()
	print("Reactor control")
	print("i for on, o for off, b for back")
	while run == 1 do
		local event, keyR = os.pullEvent("key")
		if(keyR == keys.i) then
			print("Reactor on")
			rednet.send(1,"turnOn")
		elseif(keyR == keys.o) then
			print("Reactor off")
			rednet.send(1,"turnOff")
		elseif(keyR == keys.b) then
			run = 0
		end
	end
end


function update()
	shell.run("DonOS/update")
	sleep(2)
end

function newTab()
	shell.run("bg ")
end

function setKeys()
	DonKeyAPI.set("reactor",keys.leftCtrl,keys.r,text)
	DonKeyAPI.set("update",keys.leftCtrl,keys.u,update)
	DonKeyAPI.set("newTab",keys.leftCtrl,keys.n,newTab)
end

rednet.open("back")
alias()
--setKeys()
-- while true do
	-- start()
	-- main()
-- end

shell.run("DonOS/Pocket/menu")
