os.loadAPI("DonOS/Ref/DonWrapList")
os.loadAPI("DonOS/Helpers/DonWrap")
rednet.open(DonWrap.wrap(DonWrapList.modem))
function send(id,value)
	rednet.send(id,value)
end

function recive()
	local id,msg,pro = rednet.receive()
	data = textutils.unserialize(msg)
	send(data["rId"],msg)
end

while true do
	recive()
	sleep(1)
end


