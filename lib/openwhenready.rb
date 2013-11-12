require "openwhenready/version"
require "launchy"
require "uri"
require "Socket"
require "Resolv"

module Openwhenready

  class << self

    def open(url)
      url = normalize_url(url)
      uri = URI(url)
      ip, port = Resolv.getaddress(uri.host), uri.port
      puts " waiting for #{url} to accept connections "
      sleep 1 until port_open?(ip, port)
      puts " opening #{url} in your browser "
      Launchy.open(url)
    end

    def port_open?(ip, port)
      # From http://stackoverflow.com/questions/3464551/shortening-socket-timeout-using-timeouttimeoutn-does-not-seem-to-work-for-me/3473208#3473208
      socket_family = ip.include?(":") ? Socket::AF_INET6 : Socket::AF_INET
      s = Socket.new(socket_family, Socket::SOCK_STREAM, 0)
      sa = Socket.sockaddr_in(port, ip)

      begin
        s.connect_nonblock(sa)
      rescue Errno::EINPROGRESS
        if IO.select(nil, [s], nil, 1)
          begin
            s.connect_nonblock(sa)
          rescue Errno::EISCONN
            return true
          rescue Errno::ECONNREFUSED, Errno::EHOSTUNREACH
            return false
          end
        end
      end

      return false
    end

    def normalize_url(url)
      # On OS X localhost gets resolved to an ipv6 address, but most
      # webservers only listen to ipv4, so let's hardcode ipv4 for
      # localhost
      url = url.gsub("localhost", "127.0.0.1") 
      if url =~ /^[^:]+:\/\//
        url
      else
        "http://#{url}"
      end
    end

  end

end
