os.loadAPI("DonOS/Ref/DonTypeRef")
version = 1
DonType = DonTypeRef.none
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

if(pocket) then
	shell.run("DonOS/Pocket/startup")
elseif(computer) then
	if(DonType == "None") then
		shell.run("startup")
	else
		shell.run("DonOS/Computer/"..DonType.."startup")
	end
elseif(turtle) then
	shell.run("DonOS/Turtle/startup")
end





