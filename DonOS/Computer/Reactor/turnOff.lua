print("Reactor Off")

br = peripheral.wrap(DonWrap.wrap(DonWrapList.reactor))
br.setActive(false)
rs.setOutput(DonWrap.wrap(DonWrapList.capBank),false)