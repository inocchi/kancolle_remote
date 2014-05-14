# -*- encoding: utf-8 -*-
require "csv"

class LogicMstData
  extend LogicHelper
end

class <<  LogicMstData

  def read
    # ship
    MstShip.delete_all
    reader = CSV.open("data/ships.csv", "r")
    header = reader.take(1)[0]
    MstShip.transaction {
      reader.each do |row|
        MstShip.create!(id: row[0].to_i, name: row[1])
      end
    }

    # mission
    MstMission.delete_all
    reader = CSV.open("data/missions.csv", "r")
    header = reader.take(1)[0]
    MstMission.transaction {
      reader.each do |row|
        MstMission.create!(id: row[0].to_i, name: row[1])
      end
    }
  end

end
