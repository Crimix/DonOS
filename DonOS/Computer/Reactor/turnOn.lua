print("Reactor On")

br = peripheral.wrap(DonWrap.wrap(DonWrapList.reactor))
br.setActive(true)
if(DonWrap.wrap(DonWrapList.capBank) == nil) then
else
	rs.setOutput(DonWrap.wrap(DonWrapList.capBank),true)
end