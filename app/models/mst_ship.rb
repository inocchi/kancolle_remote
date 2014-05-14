# -*- encoding: utf-8 -*-
class MstShip < ActiveRecord::Base
  attr_accessible :id, :name

  def self.get_name(ship_id)
    ship = MstShip.find(ship_id.to_i) rescue nil
    ship.nil? ? "ship#{ship_id}" : ship.name
  end 
end
