# -*- encoding: utf-8 -*-
class HenseiController < ApplicationController

  # 
  def show
    LogicDeck.update  # TODO: delete(debug code)
    @ships= LogicDeck.get_ships
    @deck = LogicDeck.get_deck(1)
  end

end
