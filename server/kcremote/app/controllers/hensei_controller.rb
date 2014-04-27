# -*- encoding: utf-8 -*-
class HenseiController < ApplicationController

  # 
  def show
    api_data = LogicPacket.get_response(KcApi::PORT)
    @ships= LogicPacket.get_ships(api_data)
  end

end
