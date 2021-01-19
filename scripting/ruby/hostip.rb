#!/usr/bin/env ruby

# Author:: Andrew Pennebaker (andrew.pennebaker@gmail.com)
#
# KOPIMI
#
# == Usage
#
# hostip [OPTIONS] [<ip1> <ip2> <ip3> ...]
#
# --help, -h:
#    help with usage
#
# --address, -a <IP>:
#    show information for specific IP address
#
# --position, -p:
#    show latitude and longitude

require 'getoptlong'
require 'open-uri'
require 'contracts'
include Contracts

Contract Hash => String
def self.prepare_api(settings)
    ip = settings[:ip]

    url = "http://#{settings[:domain]}#{settings[:api]}"
    url += "&ip=#{ip}" unless ip == ''
    url += '&position=true' if settings[:position]

    url
end

Contract Hash => ArrayOf[String]
def geoip(settings)
    url = prepare_api(settings)

    begin
        open(url) { |f| f.readlines }
    rescue
        raise "Unable to access #{url}"
    end
end

Contract nil => nil
def usage
    system("more #{$PROGRAM_NAME}")
    exit(0)
end

def main
    settings = {
        domain: 'api.hostip.info',
        api: '/get_html.php?',
        ip: '',
        position: false
    }

    begin
        opts = GetoptLong.new(
            ['--help', '-h', GetoptLong::NO_ARGUMENT],
            ['--address', '-a', GetoptLong::REQUIRED_ARGUMENT],
            ['--position', '-p', GetoptLong::NO_ARGUMENT]
        )

        opts.each do |option, value|
            case option
            when '--help'
                usage
            when '--address'
                settings[:ip] = value
            when '--position'
                settings[:position] = true
            else
                usage
            end
        end
    rescue
        usage
    end

    args = [] + ARGV
    args << '' if args.length == 0

    args.each do |ip|
        settings[:ip] = ip
        begin
            puts geoip(settings)
        rescue SocketError
            puts "Could not connect to #{settings[:domain]}"
        end
    end
end

if $PROGRAM_NAME == __FILE__
    begin
        main
    rescue Interrupt
        nil
    end
end
