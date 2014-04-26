# -*- encoding: utf-8 -*-
class LogicPacket
  extend LogicHelper
 
  @@response = {}  # key: api, value: response
  @@cur_api = "" 

  # @param  [String]  api :
  def self.post(api)
    @@response[api] = ""
    @@cur_api = api
  end

  # @param  [String]  api :
  def self.clear_response(api)
    @@response[api] = ""
  end

  # @param  [String]  api
  # @return [String]  response
  def self.get_response(api)
    @@response[api] || ""
  end

  # @param  [String]  res :
  def self.receive_response(res)
    @@response[@@cur_api] = res
  end 

end

