os.loadAPI("DonOS/api/DonButtonAPI")
os.loadAPI("DonOS/Ref/DonRednetRef")
os.loadAPI("DonOS/Ref/DonWrapList")
os.loadAPI("DonOS/Helpers/DonWrap")
os.loadAPI("DonOS/api/DonKeyAPI")
version = 1.11
function start()
  term.clear()
  term.setCursorPos(1,1)
  term.setTextColor(colors.yellow)
  print("DonOS V"..version)
  term.setTextColor(colors.white)
end

if(fs.exists("userstartup"))then
	shell.run("userstartup")
end

start()
shell.setAlias("update","DonOS/update")
if(pocket) then
	shell.run("DonOS/Pocket/startup")
elseif(turtle) then
	shell.run("DonOS/Turtle/startup")
else
	if(fs.exists("temp/type")) then
		file = fs.open("temp/type","r")
		DonType = file.readLine()
		file.close()
		if(fs.exists("DonOS/Computer/"..DonType.."/startup"))then
			shell.run("DonOS/Computer/"..DonType.."/startup")
		else
			print("Type is not correct")
		end
	else
		print("Master i don't know what to do")
		print("Plz select a type for me")
		file = fs.open("temp/type","w")
		local input = read()
		file.writeLine(input)
		file.close()
	end
end





