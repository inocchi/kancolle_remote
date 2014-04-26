# -*- encoding: utf-8 -*-
class LogicState
  extend LogicHelper
end

module State
  NONE = 0
  BOKOU = 1
  HENSEI = 2
  HOKYU = 3
  KAISOU = 4
  NYUKYO = 5
  KOUSYO = 6
  QUEST = 7
  ENSEI_RESULT = 8

  Name = {
    State::NONE=> "none",
    State::BOKOU=> "母港",
    State::HENSEI=> "編成",
    State::HOKYU=> "補給",
    State::KAISOU=> "改装",
    State::NYUKYO=> "入渠",
    State::KOUSYO=> "工廠",
    State::QUEST=> "任務",
    State::ENSEI_RESULT=> "遠征結果",
  }
end

class <<  LogicState

  @@state = State::NONE

  # stateをセット
  def set_state(state)
    @@state = state
    logger.debug("set state=#{State::Name[@@state]}")
  end

  # stateを取得
  def get_state
    @@state
  end

end
