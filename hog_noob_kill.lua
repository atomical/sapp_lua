api_version = "1.10.1.0"
drivers = {}

function OnScriptUnload() end

function OnScriptLoad()
  register_callback(cb['EVENT_JOIN'], "VersionAnnounce")
  register_callback(cb['EVENT_KILL'], "EventHogNoobCheck")
  register_callback(cb["EVENT_VEHICLE_ENTER"], "EventVehicleEnter")
  register_callback(cb["EVENT_VEHICLE_EXIT"], "EventVehicleExit")
  register_callback(cb["EVENT_DIE"], "EventVehicleExit")
  register_callback(cb["EVENT_LEAVE"], "EventVehicleExit")
  register_callback(cb["EVENT_MAP_RESET"], "EventMapReset")
end

-- Events

function VersionAnnounce(PlayerIndex)
  say(PlayerIndex, "Hog Noob Killer 1.0.1b loaded...")
end

function EventMapReset()
  say_all("Hog Noob Killer reloaded...")
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
      say(PlayerIndex, "You were killed because you are a hog noob!")
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
