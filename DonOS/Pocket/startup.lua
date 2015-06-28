
function alias()
	shell.setAlias("update","DonOS/update")
	shell.setAlias("DonHelp","DonOS/commands")
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

shell.run("DonOS/Pocket/menu")
