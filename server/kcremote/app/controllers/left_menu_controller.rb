# -*- encoding: utf-8 -*-
class LeftMenuController < ApplicationController

  # 母港
  def bokou
    LogicTransition.bokou(Mouse::LMenu::BOKOU_X, Mouse::LMenu::BOKOU_Y)
    redirect_to controller: "bokou", action: "show"
  rescue => e
    error_log(e)
  end

  # 編成
  def hensei
    LogicTransition.hensei(Mouse::LMenu::HENSEI_X, Mouse::LMenu::HENSEI_Y)
    redirect_to controller: "hensei", action: "show"
  rescue => e
    error_log(e)
  end
 
  # 補給
  def hokyu
    LogicTransition.hokyu(Mouse::LMenu::HOKYU_X, Mouse::LMenu::HOKYU_Y)
    redirect_to controller: "hokyu", action: "show"
  rescue => e
    error_log(e)
  end
  
  # 改装
  def kaisou
    LogicTransition.kaisou(Mouse::LMenu::KAISOU_X, Mouse::LMenu::KAISOU_Y)
    redirect_to controller: "kaisou", action: "show"
  rescue => e
    error_log(e)   
  end

  # 入渠
  def nyukyo
    LogicTransition.nyukyo(Mouse::LMenu::NYUKYO_X, Mouse::LMenu::NYUKYO_Y)
    redirect_to controller: "nyukyo", action: "show"
  rescue => e
    error_log(e)
  end

  # 工廠
  def kousyo
    LogicTransition.kousyo(Mouse::LMenu::KOUSYO_X, Mouse::LMenu::KOUSYO_Y)
    redirect_to controller: "kousyo", action: "show"
  rescue => e
    error_log(e)
  end

end
