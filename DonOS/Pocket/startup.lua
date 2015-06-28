local satId

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


function readIDS()
	if(fs.exists("temp/satId")) then
		file = fs.open("temp/satId","r")
		satId = tonumber(file.readLine())
		file.close()
	end
end

function saveIDS()
	if(fs.exists("temp/satId")) then
		fs.delete("temp/satId")
	end
	file = fs.open("temp/satId","w")
	file.writeLine(satId)
	file.close()
end	


function register()
	dataList ={}
	dataList["sId"] = os.computerID()
	dataList["rId"] = "pocket"
	dataList["msg"] = "type"
	rData = textutils.serialize(dataList)
	rednet.broadcast(rData)
end

if(fs.exists("temp/id")) then
	readIDS()
else
	register()
	local id,msg,pro = rednet.receive()
	satId = id
	saveIDS()
	fs.open("temp/id","w")
end

shell.run("DonOS/Pocket/menu")
