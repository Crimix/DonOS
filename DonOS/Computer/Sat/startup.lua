rednet.open(DonWrap.wrap(DonWrapList.modem))
function send(id,value)
	rednet.send(id,value)
end

function recive()
	local id,msg,pro = rednet.receive()
	data = textutils.unserialize(msg)
	print("Recived command"..data["msg"])
	send(data["rId"],msg)
end

while true do
	recive()
	sleep(1)
end



