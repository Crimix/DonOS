local dataListM ={}
local satId

function reactor()
	dataListM ={}
	dataListM["sId"] = os.computerID()
	dataListM["rId"] = "reactor"
	dataListM["msg"] = "toggle"
	msg = textutils.serialize(dataListM)
	rednet.send(satId,msg)
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
	rednet.send(satId,msg)
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



function main()
	setButtons()
	DonButtonAPI.update()
	while true do
		local event, side, x, y = os.pullEvent("mouse_click")
		DonButtonAPI.getButton(x,y)
	end
end

main()