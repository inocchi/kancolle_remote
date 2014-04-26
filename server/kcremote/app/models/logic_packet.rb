# -*- encoding: utf-8 -*-
class LogicPacket
  extend LogicHelper

  # @param  [String]  api :
  # @param  [int]     x   :
  # @param  [int]     y   :
  def self.wait_response(api, x, y)
    res = _get_res(api)
    res.response = ""
    res.save! 

    LogicMouse.click(x, y)

    res = nil
    timeout(20) {
      while true
        res = LogicPacket.get_response(api)
        break if res != ""
        sleep(1)
      end
    } 
    res
  end

  # @param  [String]  api :
  def self.post(api)
    res = _get_res(api)
    res.response = ""
    res.save!
  end
 
  # @param  [String]  api
  # @param  [String]  response :
  def self.receive_response(api, response)
    res = _get_res(api)
    res.response = response
    res.save!
  end

  # @param  [String]  api
  # @return [String]  response
  def self.get_response(api)
    res = 
    Response.uncached do
      _get_res(api)
    end
    res.response
  end

  # @param  [String]  api
  def self._get_res(api)
    res = Response.find(:first, conditions: ["api = ?", api])
    res = Response.new(api: api, response: "") if res.nil?
    res
  end

end

