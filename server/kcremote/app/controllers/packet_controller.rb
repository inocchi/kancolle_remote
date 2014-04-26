# -*- encoding: utf-8 -*-

# packet_capture/capture.rbから呼ばれる
class PacketController < ApplicationController

  def notify_post
    str = params[:text]
    LogicPacket.post(str)
    render json: { msg: "OK! Post" }
  rescue => e
    error_log(e)
  end

  def notify_response
    str = params[:text]
    LogicPacket.receive_response(str)
    render json: { msg: "OK! Res" }
  rescue => e
    error_log(e)
  end
end
