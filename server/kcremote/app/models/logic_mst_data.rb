# -*- encoding: utf-8 -*-
require "csv"

class LogicMstData
  extend LogicHelper
end

class <<  LogicMstData

  @@mst_ships = []
  @@mst_missions = []

  def read
    # ship
    @@mst_ships = []
    reader = CSV.open("data/ships.csv", "r")
    header = reader.take(1)[0]
    reader.each do |row|
      @@mst_ships << {
        id: row[0].to_i,
        name: row[1],
      }
    end

    # mission
    @@mst_missions = []
    reader = CSV.open("data/missions.csv", "r")
    header = reader.take(1)[0]
    reader.each do |row|
      @@mst_missions << {
        id: row[0].to_i,
        name: row[1],
      }
    end 
  end

  def get_ship_name(ship_id)
    ship = @@mst_ships.find{ |x| x[:id] == ship_id.to_i }
    ship.nil? ? "ship#{ship_id}" : ship[:name]
  end

  def get_mission_name(mission_id)
    mission = @@mst_missions.find{ |x| x[:id] == mission_id }
    mission.nil? ? "mission#{mission_id}" : mission[:name]
  end 

  def get_missions
    @@mst_missions
  end

  def get_ships
    @@mst_ships
  end

end
