# -*- encoding: utf-8 -*-
class LogicDeck
  extend LogicHelper
end

class <<  LogicDeck

  @@ships = []  # ship_info[Array<Hash>]
  @@deck = {} # key: deck_id, value: ship_info[Array<Hash>]

  def get_ships
    @@ships
  end

  def update
    api_data = LogicPacket.get_response(KcApi::PORT)

logger.warn( "1: #{LogicMstData.get_ships}" )
    # ship
    @@ships = []
    api_data["api_ship"].each do |ship|
      @@ships << _get_ship_info(ship)
    end

    # deck
    @@deck = {}
    ids = []
    api_data["api_deck_port"].each do  |deck|
      ids.concat( deck["api_ship"] )
    end
    ids.delete( -1 )
    ships = api_data["api_ship"].select{ |x| ids.include?( x["api_id"] ) }
    api_data["api_deck_port"].each do |deck|
      ship_infos = []
      deck["api_ship"].each do |id|
        next if id == -1
        ship_infos << _get_ship_info( ships.find{ |x| x["api_id"] == id } )
      end
      @@deck[ deck["api_id"] ] = ship_infos
      ids.concat( deck["api_ship"] )
    end 
logger.warn( "2: #{LogicMstData.get_ships}" )
    @@deck
  end

  # デッキ
  def get_deck(deck_id)
    @@deck[deck_id]
  end

  # @param  [Hash]  ship
  def _get_ship_info(ship)
    {
      #id: ship["api_id"],
      name: LogicMstData.get_ship_name(ship["api_ship_id"]),
      lv: ship["api_lv"],
      exp: "#{ship["api_exp"][2]}% あと#{ship["api_exp"][1]}",
      hp: ship["api_nowhp"].to_s + " / " + ship["api_maxhp"].to_s,
      hp_ratio: _get_str_state(ship["api_nowhp"], ship["api_maxhp"]),
      cond: _get_str_cond(ship["api_cond"]), 
    } 
  end

  def _get_str_state(hp, max_hp)
    ratio = hp.to_f / max_hp.to_f
    state = 
    if ratio > 0.75
      ""
    elsif ratio > 0.5
      "小破"
    elsif ratio > 0.25
      "中破"
    else
      "大破"
    end
    ratio.round(4).to_s + (state == "" ? "" : " (#{state})")
  end

  def _get_str_cond(cond)
    state = 
    if cond >= 50
      "キラキラ"
    elsif cond >= 40
      ""    # 通常
    elsif cond >= 30
      "間宮"
    elsif cond >= 20
      "オレンジ"
    elsif cond >= 0
      "赤"
    end
    cond.to_s + (state == "" ? "" : " (#{state})")
  end

end
