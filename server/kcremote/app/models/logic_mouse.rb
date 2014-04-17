# -*- encoding: utf-8 -*-
class LogicMouse
end

class <<  LogicMouse

  def click(x, y)
    system("xte 'mousemove #{x} #{y}'")
    system("xte 'mouseclick 1'")
  end

end
