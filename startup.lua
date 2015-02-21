version = 1
function start()
  term.clear()
  term.setCursorPos(1,1)
  term.setTextColor(colors.yellow)
  print("DonOS V"..version)
  term.setTextColor(colors.white)
end

start()
print("Tip: Run update to get the newest version of the updateList")
print("Tip: Run updateAll to get the latests version of DonOS")


