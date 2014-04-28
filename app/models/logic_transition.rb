# -*- encoding: utf-8 -*-
class LogicTransition
  extend LogicHelper
end

class <<  LogicTransition

  def bokou(x, y)
    LogicPacket.wait_response(KcApi::WAIT_BOKOU, x, y)
    LogicState.set_state(State::BOKOU)
  end

  def hensei(x, y)
    LogicMouse.click(x, y)
    LogicState.set_state(State::HENSEI)
  end

  def hokyu(x, y)
    LogicMouse.click(x, y)
    LogicState.set_state(State::HOKYU) 
  end

  def kaisou(x, y)
    LogicMouse.click(x, y)
    LogicState.set_state(State::KAISOU) 
  end

  def nyukyo(x, y)
    LogicPacket.wait_response(KcApi::WAIT_NYUKYO, x, y)
    LogicState.set_state(State::NYUKYO) 
  end

  def kousyo(x, y)
    LogicMouse.click(x, y)
    LogicState.set_state(State::KOUSYO) 
  end

end
