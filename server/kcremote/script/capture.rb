# -*- encoding: utf-8 -*-

require 'pcap'
require 'json'

def send(method_name, hash)
  str = hash.to_s
  p "len:#{str.length}"
  p "#{str.count('{')},#{str.count('}')},#{str.count('[')},#{str.count(']')}"
  p "1: #{str[0..100]}"
  p "2: #{str[(str.length-100)..str.length]}"

  system("curl -H \"Accept: application/json\" -H \"Content-type: application/json\" -X POST -d '#{hash.to_json}' http://localhost:3102/packet/#{method_name}")
end 

# main
httpdump = Pcap::Capture.open_live("eth0", 5000,true,1000)

server_ip = "125.6.184.15"
HTTP_REQUEST  = Pcap::Filter.new("tcp and dst port 80 and host #{server_ip}", httpdump)
HTTP_RESPONSE = Pcap::Filter.new("tcp and src port 80 and host #{server_ip}", httpdump)

httpdump.setfilter(HTTP_REQUEST | HTTP_RESPONSE)
svdata = ""
api = ""
httpdump.each_packet {|pkt|
  data = pkt.tcp_data
  case pkt
  when HTTP_REQUEST
    if data and data =~ /^POST\s+(\S+)/
      api = $1
      svdata = ""
      p "notify_post: #{api}"
      send("notify_post", {api: api})
    end
  when HTTP_RESPONSE
    if data
      if data =~ /^(HTTP\/.*)$/
        tmp = pkt.tcp_data
        tmp =~ /^svdata=({.*)$/
        svdata = $1
      else
        svdata += data unless svdata.nil? # 音声データを受信したときnilになってる
      end
    end
    p "total=#{svdata.length}, len=#{pkt.tcp_data_len}, ack=#{pkt.tcp_ack}, seq=#{pkt.tcp_seq}, preq=#{pkt.tcp_seq - pkt.tcp_data_len}, #{pkt.tcp_flags_s}" unless svdata.nil?
    if pkt.tcp_fin? && !svdata.nil? && svdata != ""
      send("notify_response", {api: api, res: svdata[0..svdata.rindex('}')]}) # chunkedのデータの場合最後に0が入ってるから削除する
#        p "res=#{svdata}" unless api.index("ship")
      api = svdata = ""
    end
  end
}

