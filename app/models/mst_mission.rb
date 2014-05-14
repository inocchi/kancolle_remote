# -*- encoding: utf-8 -*-
class MstMission < ActiveRecord::Base
  attr_accessible :id, :name
 
  def self.get_name(mission_id)
    mission = MstMission.find(mission_id.to_i) rescue nil
    mission.nil? ? nil : mission.name
  end  
end
