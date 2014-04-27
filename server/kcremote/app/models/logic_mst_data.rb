# -*- encoding: utf-8 -*-
require "csv"

class LogicMstData
  extend LogicHelper
end

class <<  LogicMstData

  @@ships = []
  @@missions = []

  def read
    # ship
    @@ships = []
    reader = CSV.open("data/ships.csv", "r")
    header = reader.take(1)[0]
    reader.each do |row|
      @@ships << {
        id: row[0].to_i,
        name: row[1],
      }
    end

    # mission
    @@missions = []
    reader = CSV.open("data/missions.csv", "r")
    header = reader.take(1)[0]
    reader.each do |row|
      @@missions << {
        id: row[0].to_i,
        name: row[1],
      }
    end 
  end

  def get_ship_name(ship_id)
    ship = @@ships.find{ |x| x[:id] == ship_id }
    ship.nil? ? "ship#{ship_id}" : ship[:name]
  end

  def get_mission_name(mission_id)
    mission = @@missions.find{ |x| x[:id] == mission_id }
    mission.nil? ? "mission#{mission_id}" : mission[:name]
  end 

  def get_missions
    @@missions
  end

  def get_ships
    @@ships
  end

end
