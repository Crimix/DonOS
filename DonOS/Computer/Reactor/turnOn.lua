print("Reactor On")

br = peripheral.wrap(DonWrap.wrap(DonWrapList.reactor))
br.setActive(true)
rs.setOutput(DonWrap.wrap(DonWrapList.capBank),true)