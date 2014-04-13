# -*- encoding: utf-8 -*-
class LogicState
  extend LogicHelper
end

module State
  NONE = 0
  BOKOU = 1
  ENSEI_RESULT = 2
  NYUKYO = 3

  Name = {
    State::NONE=> "none",
    State::BOKOU=> "母港",
    State::ENSEI_RESULT=> "遠征結果",
    State::NYUKYO=> "入渠",
  }
end

class <<  LogicState

  @state = State::NONE

  # stateをセット
  def set_state(state)
    @state = state
    logger.debug("set state=#{State::Name[@state]}")
  end

  # stateを取得
  def get_state
    @state
  end

  # APIのPOSTを通知
  def notify_post(str)
    if str.index(KcApi::LOGIN_CHECK)
      set_state(State::BOKOU)
    elsif str.index(KcApi::NYUKYO_LIST)
      set_state(State::NYUKYO)
    end
  end

end
