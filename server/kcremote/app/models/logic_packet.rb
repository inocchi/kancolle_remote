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
        res = LogicPacket.get_response(api, false)
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
  # @param  [bool]    is_hash : true=戻り値をハッシュにする, false=戻り値をstringにする
  # @return [Hash / String]  response
  def self.get_response(api, is_hash=true)
    res = 
    Response.uncached do
      _get_res(api)
    end
    ret = res.response
    if is_hash
      ret = JSON.parse(ret)
      ret = ret["api_data"] if ret["api_result"] == 1
    end
    ret
  end

  # @param  [String]  api
  def self._get_res(api)
    res = Response.find(:first, conditions: ["api = ?", api])
    res = Response.new(api: api, response: "") if res.nil?
    res
  end

  # 資材
  def self.get_material(api_data)
    material = api_data["api_material"]
    {
      fuel: _get_material_value(material, 1),
      bullet: _get_material_value(material, 2),
      iron: _get_material_value(material, 3),
      bauxite: _get_material_value(material, 4),
    }
  end

  def self._get_material_value(material, api_id)
    m = material.find{ |x| x["api_id"] == api_id }
    m["api_value"]
  end

end

