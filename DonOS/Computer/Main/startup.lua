rednet.open(DonWrap.wrap(DonWrapList.modem))
print("Main V2 By DonF")
local list ={}
local dataList ={}
local satId

function refresh(value)
	dataList ={}
	id = value["sId"]
	dataList["sId"] = os.computerID()
	dataList["rId"] = id
	dataList["msg"] = "refreshMain"
	dataList["data"] = list
	rData = textutils.serialize(dataList)
	rednet.send(satId,rData)
end

function setList(value)
	list ={}
	list = value["data"]
end

function recive()
	local id,msg,pro = rednet.receive()
	satId = id
	data = textutils.unserialize(msg)
	if(data["msg"] == "refresh")then
		refresh(data)
	elseif(data["msg"] == "setList")then
		setList(data)
	end
end



function register()
	dataList ={}
	dataList["sId"] = os.computerID()
	dataList["rId"] = "main"
	dataList["msg"] = "type"
	rData = textutils.serialize(dataList)
	rednet.broadcast(rData)
end


if(fs.exists("temp/id")) then
else
	register()
	file = fs.open("temp/id","w")
	file.close()
end
while true do
	recive()
end