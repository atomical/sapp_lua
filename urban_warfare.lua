-- For Bigass Final UrbanWarfare game type
api_version = "1.10.1.0"
drivers = {}

function OnScriptUnload() end

function OnScriptLoad()
  register_callback(cb["EVENT_PRESPAWN"], "EventPreSpawn")
  register_callback(cb['EVENT_VEHICLE_ENTER'], "OnEnterVehicle")
end

function EventPreSpawn(PlayerIndex)
  team = get_var(PlayerIndex, "$team")
  if team == "red" then
    write_vector3d(get_dynamic_player(PlayerIndex) + 0x5C, 40.83292, 10.4025, 1)
    spawn_object("weap", "reach\\objects\\weapons\\pistol\\magnum\\gold magnum", 40.83292, 10.4025, 2)
    spawn_object("weap", "weapons\\gauss sniper\\gauss sniper", 40.83292, 10.4025, 2)
  elseif team == "blue" then
    write_vector3d(get_dynamic_player(PlayerIndex) + 0x5C, 6.92, -46.80, 3.21)
    spawn_object("weap", "reach\\objects\\weapons\\pistol\\magnum\\gold magnum", 6.92, -46.80, 3.21)
  end
end

--Function evaluates players vehilce and allows for specific actions to take place for specific vehilces
function OnEnterVehicle(PlayerIndex)
  local player_dyn = get_dynamic_player(PlayerIndex)
  if(player_dyn ~= 0) then
    local vehicle = read_dword(player_dyn + 0x11C)
    if (vehicle ~= -1) then
      local mem = get_object_memory(vehicle)
      local tagid = read_dword(mem)
      --say(PlayerIndex, "VEHI TAG: "..tagid.." END")
      if(mem ~= 0) then
        if (tagid == 3867608339) then
              say(PlayerIndex, "No falcons for now. k thnk bai! Ejecting ...")
              timer(3000, "getout", PlayerIndex)
        end
      end
    end
  end
end
