# -*- encoding: utf-8 -*-

require 'pcap'

def send(method_name, text)
  system("curl http://localhost:3102/packet/#{method_name} -d text=\"#{text}\"")
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
      send("notify_post", api)
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
        send("notify_response", svdata)
#        p "res=#{svdata}" unless api.index("ship")
        svdata = ""
      end

    end
  end
}

