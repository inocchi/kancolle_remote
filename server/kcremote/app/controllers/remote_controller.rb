# -*- encoding: utf-8 -*-
class RemoteController < ApplicationController

  def nyuukyo
    LogicMouse.click(MousePos::NYUUKYO_X, MousePos::NYUUKYO_Y)
  end
end
