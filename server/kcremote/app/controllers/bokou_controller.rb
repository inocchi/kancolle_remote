# -*- encoding: utf-8 -*-
class BokouController < ApplicationController

  # 
  def show

  end

  # 入渠
  def nyukyo
    wait_api = KcApi::NYUKYO_LIST
    LogicPacket.clear_response(wait_api)
    LogicMouse.click(Mouse::Bokou::NYUKYO_X, Mouse::Bokou::NYUKYO_Y)
    res = nil
    timeout(20) {
      while true
        res = LogicPacket.get_response(wait_api)
        break if res != ""
        sleep(1)
      end
    }
    render json: {msg: "NYUKYO OK!"}
  rescue => e
    error_log(e) 
  end

end
