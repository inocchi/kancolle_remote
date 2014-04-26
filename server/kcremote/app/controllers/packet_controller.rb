# -*- encoding: utf-8 -*-

# packet_capture/capture.rbから呼ばれる
class PacketController < ApplicationController

  def notify_post
    api = params[:api]
    LogicPacket.post(api)
    render json: { msg: "OK! Post" }
  rescue => e
    error_log(e)
  end

  def notify_response
    api = params[:api]
    res = params[:res]
    LogicPacket.receive_response(api, res)
    render json: { msg: "OK! Res" }
  rescue => e
    error_log(e)
  end
end
