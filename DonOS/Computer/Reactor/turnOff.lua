print("Reactor Off")

br = peripheral.wrap(DonWrap.wrap(DonWrapList.reactor))
br.setActive(false)
if(DonWrap.wrap(DonWrapList.capBank) == nil) then
else
	rs.setOutput(DonWrap.wrap(DonWrapList.capBank),false)
end