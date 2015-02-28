os.loadAPI("DonOS/Ref/DonRednetRef")
os.loadAPI("DonOS/Ref/DonWrapList")
os.loadAPI("DonOS/Helpers/DonWrap")
rednet.open(DonWrap.wrap(DonWrapList.modem))
print("Main V1 By DonF")
local list ={}
local dataList ={}

function refresh(value)
	id = value["sId"]
	dataList["sId"] = DonRednetRef.main
	dataList["rId"] = id
	dataList["msg"] = "refresh"
	dataList["data"] = list
	rData = textutils.serialize(dataList)
	rednet.send(id,rData)
end

function setList(value)
	list = value["data"]
end

function recive()
	local id,msg,pro = rednet.receive()
	data = textutils.unserialize(msg)
	if(data["msg"] == "refresh")then
		refresh(data)
	elseif(data["msg"] == "setList")then
		setList(data)
	end
end

while true do
	recive()
	sleep(1)
end