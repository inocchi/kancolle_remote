# -*- encoding: utf-8 -*-

require 'pcap'
require 'json'

def send(method_name, hash)
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
    else
      if pkt.tcp_fin? && !svdata.nil? && svdata != ""
        send("notify_response", {api: api, res: svdata.force_encoding("UTF-8")})
#        p "res=#{svdata}" unless api.index("ship")
        api = svdata = ""
      end

    end
  end
}

