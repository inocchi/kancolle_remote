# -*- encoding: utf-8 -*-
class BattleTopController < ApplicationController

  # 
  def show

  end

  def battle
    LogicMouse.click(Mouse::BattleTop::BATTLE_X, Mouse::BattleTop::BATTLE_Y)
    redirect_to controller: "battle", action: "show"
  rescue => e
    error_log(e)
  end

  def practice
    LogicMouse.click(Mouse::BattleTop::PRACTICE_X, Mouse::BattleTop::PRACTICE_Y)
    redirect_to controller: "practice", action: "show"
  rescue => e
    error_log(e)
  end

  def ensei
    LogicTransition.ensei(Mouse::BattleTop::ENSEI_X, Mouse::BattleTop::ENSEI_Y)
    redirect_to controller: "ensei", action: "show"
  rescue => e
    error_log(e)
  end
end
