#!/usr/bin/env ruby

# Author:: Andrew Pennebaker (andrew.pennebaker@gmail.com)
# Copyright:: Copyright 2007 Andrew Pennebaker
#
# == Credits
#
# http://snippets.dzone.com/posts/show/2469
#
# == Usage
#
# download [OPTIONS] <url1> <url2> <url3> ...
#
# --help, -h:
#    get help with usage
#
# --list-user-agents, -y:
#    list user agents from useragents.yaml
#
# --outfile, -o <file>:
#    specify an outputfile (else uses URL suffix)
#    do not use with multiple URLs
#
# --user-agent, -u <string>:
#    specify a user agent. if not in useragents.yaml by name, string is used as the agent.

require 'getoptlong'
require 'open-uri'

require 'contracts'
include Contracts

#
# Downloader
#
module Download
    DEFAULT_USER_AGENT = "Ruby/#{RUBY_VERSION}"

    Contract File => Hash
    def load_user_agents(stream)
        require 'yaml'

        user_agents = {}

        YAML.load(stream).each { |name, string| user_agents[name] = string }

        user_agents
    end

    Contract String => String
    def self.getfilename(url)
        url.split('/')[-1]
    end

    Contract String, String, String => String
    def download(url, filename = '', user_agent = Download::DEFAULT_USER_AGENT)
        open(url, 'User-Agent' => user_agent) do |filein|
            filename = getfilename(url) unless filename.length > 0

            open(filename, 'wb') do |fileout|
                filein.each do |line|
                    fileout.write(line)
                end
            end
        end
    rescue
        raise "Could not download #{url}"
    end
end

Contract nil => nil
def usage
    system("more #{$PROGRAM_NAME}")
    exit(0)
end

def main
    mode = :download

    outfile = ''
    user_agent = Download::DEFAULT_USER_AGENT

    user_agents = {}

    begin
        open("#{File.dirname($PROGRAM_NAME)}/useragents.yaml") do |file|
            user_agents = load_user_agents(file)
        end
    rescue Errno::ENOENT => e
        nil
    end

    opts = GetoptLong.new(
        ['--help', '-h', GetoptLong::NO_ARGUMENT],
        ['--list-user-agents', '-y', GetoptLong::NO_ARGUMENT],
        ['--outfile', '-o', GetoptLong::REQUIRED_ARGUMENT],
        ['--user-agent', '-u', GetoptLong::REQUIRED_ARGUMENT]
    )

    begin
        opts.each do |option, value|
            case option
            when '--help'
                usage
            when '--list-user-agents'
                mode = :list_user_agents
            when '--outfile'
                outfile = value
            when '--user-agent'
                value = user_agents[value]

                if value
                    user_agent = value
                else
                    puts 'Warning: agent not found or agents file not loaded'
                    user_agent = value
                end
            else
                usage
            end
        end
    rescue
        usage
    end

    if mode == :download
        usage unless ARGV > 0

        ARGV.each do |url|
            puts "Downloading #{url}"
            begin
                download(url, outfile, user_agent)
                puts 'Done'
            rescue SocketError => e
                puts "Could not connect to #{getdomain(url)}"
            end
        end
    elsif mode == :list_user_agents
        user_agents.each { |name, _| puts name }
    end
end

if $PROGRAM_NAME == __FILE__
    begin
        main
    rescue Interrupt
        nil
    end
end
