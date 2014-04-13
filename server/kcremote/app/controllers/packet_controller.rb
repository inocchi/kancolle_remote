# -*- encoding: utf-8 -*-
class PacketController < ApplicationController

  def nyuukyo
    LogicMouse.click(MousePos::NYUKYO_X, MousePos::NYUKYO_Y)
  end

  def notify_post
    str = params[:text]
    LogicState.notify_post(str)
    render json: { msg: "OK! Post" }
  rescue => e
    logger.error("msg=#{e.message}, backtrace=#{e.backtrace}")
  end

  def notify_response
    str = params[:text]
    str = ""
    case LogicState.get_state
    when State::NYUKYO
      logger.info("入渠：#{str}")
    else
      logger.info("etc: #{str}")
    end
    render json: { msg: "OK! Res" }
  rescue => e
    logger.error("msg=#{e.message}, backtrace=#{e.backtrace}")
  end
end
