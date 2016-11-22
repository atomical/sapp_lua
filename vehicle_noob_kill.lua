api_version = "1.10.1.0"
drivers = {}

function OnScriptUnload() end

function OnScriptLoad()
  register_callback(cb['EVENT_JOIN'], "VersionAnnounce")
  register_callback(cb['EVENT_KILL'], "EventHogNoobCheck")
  register_callback(cb["EVENT_VEHICLE_ENTER"], "EventVehicleEnter")

  -- All conditions where we need to update the drivers array
  register_callback(cb["EVENT_VEHICLE_EXIT"], "EventVehicleExit")
  register_callback(cb["EVENT_DIE"], "EventVehicleExit")
  register_callback(cb["EVENT_LEAVE"], "EventVehicleExit")
  register_callback(cb["EVENT_SUICIDE"], "EventVehicleExit")
  register_callback(cb["EVENT_TEAM_SWITCH"], "EventVehicleExit")
  register_callback(cb["EVENT_SPAWN"], "EventVehicleExit")

end

-- Events

function VersionAnnounce(PlayerIndex)
  say(PlayerIndex, "Vehicle Noob Killer 1.0.1b loaded...")
end

function EventVehicleEnter(PlayerIndex, Seat)
  if tonumber(Seat) == 0 then
    addDriver(PlayerIndex)
  end
end

function EventVehicleExit(PlayerIndex)
  removeDriver(PlayerIndex)
end

function EventHogNoobCheck(PlayerIndex, KilledIndex)
  if driverExists(PlayerIndex) then
    if player_alive(PlayerIndex) then
      kill(PlayerIndex)
      rprint(PlayerIndex, "You were killed for being a vehicle noob!")
      rprint(PlayerIndex, "You were killed for being a vehicle noob!")
      rprint(PlayerIndex, "You were killed for being a vehicle noob!")
    end
  end
end

function addDriver(key)
  drivers[key] = true
end

function removeDriver(key)
  drivers[key] = nil
end

function driverExists(key)
  return drivers[key] ~= nil
end
