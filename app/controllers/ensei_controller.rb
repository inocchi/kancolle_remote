# -*- encoding: utf-8 -*-
class EnseiController < ApplicationController

  # @option [int] area  : 表示するエリア
  def show
    area = params[:area]
    area = 1 if area.nil?

    api_data = LogicPacket.get_response(KcApi::WAIT_ENSEI)
    @response = {
      api: api_data,
    } 
    @area = area.to_i
  rescue => e
    error_log(e)
  end

  # @param [int] area  : エリア
  def change_area
    area = params[:area].to_i
    LogicMouse.click(Mouse::Ensei::AREA_1_X + (area - 1) * Mouse::Ensei::AREA_X_OFFSET, Mouse::Ensei::AREA_1_Y)
    redirect_to action: "show", area: area
  rescue => e
    error_log(e)
  end

  # @param  [int] index       : 
  # @param  [int] area        : エリア
  # @param  [int] mission_id  : 
  def select_mission
    index = params[:index].to_i
    area = params[:area].to_i
    mission_id = params[:mission_id].to_i

    LogicMouse.click(Mouse::Ensei::MISSION_1_X, Mouse::Ensei::MISSION_1_Y + (index - 1) * Mouse::Ensei::MISSION_Y_OFFSET)
    redirect_to action: "confirm_mission", area: area, mission_id: mission_id
  rescue => e
    error_log(e)
  end

  # @param  [int] area        : エリア
  # @param  [int] mission_id  :  
  def confirm_mission
    @area = params[:area].to_i
    @mission_id = params[:mission_id].to_i
  end

  # @param  [int] area        : エリア
  # @param  [int] mission_id  :
  def decide_mission
    area = params[:area].to_i
    mission_id = params[:mission_id].to_i 
    LogicMouse.click(Mouse::Ensei::MISSION_DECIDE_X, Mouse::Ensei::MISSION_DECIDE_Y)
    redirect_to action: "select_deck", area: area, mission_id: mission_id
  end

  # @param  [int] area        : エリア
  def cancel_mission
    area = params[:area].to_i
    LogicMouse.click(Mouse::Ensei::MISSION_CANCEL_X, Mouse::Ensei::MISSION_CANCEL_Y)
    redirect_to action: "show", area: area
  end

  # @param  [int] area        : エリア
  # @param  [int] mission_id  : 
  def select_deck
    @area = params[:area].to_i
    @mission_id = params[:mission_id].to_i
  end

  def battle
    LogicMouse.click(Mouse::Ensei::BATTLE_X, Mouse::Ensei::BATTLE_Y)
    redirect_to controller: "battle", action: "show"
  rescue => e
    error_log(e)
  end

  def practice
    LogicMouse.click(Mouse::Ensei::PRACTICE_X, Mouse::Ensei::PRACTICE_Y)
    redirect_to controller: "practice", action: "show"
  rescue => e
    error_log(e)
  end

  def ensei
    LogicMouse.click(Mouse::Ensei::ENSEI_X, Mouse::Ensei::ENSEI_Y)
    redirect_to controller: "ensei", action: "show"
  rescue => e
    error_log(e)
  end
end
