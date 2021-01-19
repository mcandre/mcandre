#!/usr/bin/env ruby

# Author:: Andrew Pennebaker (andrew.pennebaker@gmail.com)
# Copyright:: Copyright 2007 Andrew Pennebaker
#
# == Credits
#
# Luhn algorithm
#
# http://www.ioncannon.net/ruby/42/credit-card-type-and-luhn-check-in-ruby/
#
# Card prefixes
#
# http://www.beachnet.com/~hstiles/cardtype.html
#
# http://www.darkcoding.net/projects/credit-card-generator/
#
# http://en.wikipedia.org/wiki/Credit_card_number
#
# YAML example
#
# http://blade.nagaokaut.ac.jp/cgi-bin/scat.rb/ruby/ruby-talk/249719
#
# == Usage
#
# ccard [OPTIONS]
#
# --help, -h:
#    get help with usage
#
# --list-services, -y:
#    list services in ccard.yaml
#
# --generate, -g:
#    generate mode (default)
#
# --service, -s <service symbol>:
#    select a credit card service
#
# --multiple, -m <length>:
#    generate multiple numbers
#
# --validate, -v <number1> <number2> <number3> ...
#    validate mode
#
# --luhn-validate, -l <number1> <number2> <number3> ...
#    validate only by simple Luhn check

require './luhn'
require './creditcard'

require 'getoptlong'
require 'contracts'
include Contracts

Contract nil => nil
def usage
    system("more #{$PROGRAM_NAME}")
    exit(0)
end

def main
    services = {}

    begin
        f = open("#{File.dirname($PROGRAM_NAME)}/ccard.yaml")
        services = CreditCard.load_services(f)
        f.close
    rescue Errno::ENOENT
        raise 'Could not open services file'
    end

    mode = :generate
    service = services.to_a[0][1]
    numbers = 1

    opts = GetoptLong.new(
        ['--help', '-h', GetoptLong::NO_ARGUMENT],
        ['--list-services', '-y', GetoptLong::NO_ARGUMENT],
        ['--generate', '-g', GetoptLong::NO_ARGUMENT],
        ['--service', '-s', GetoptLong::REQUIRED_ARGUMENT],
        ['--multiple', '-m', GetoptLong::REQUIRED_ARGUMENT],
        ['--validate', '-v', GetoptLong::NO_ARGUMENT],
        ['--luhn-validate', '-l', GetoptLong::NO_ARGUMENT]
    )

    begin
        opts.each do |option, value|
            case option
            when '--help'
                usage
            when '--list-services'
                mode = :list_services
            when '--generate'
                mode = :generate
            when '--service'
                service = services[value.downcase]
                fail "Service not found under #{value}" unless service
            when '--multiple'
                numbers = value.to_i
            when '--validate'
                mode = :validate
            when '--luhn-validate'
                mode = :validate
                service = CreditCard.new('Custom', 'cust', 'any', 'any', 'luhn')
            else
                usage
            end
        end
    rescue
        usage
    end

    if mode == :generate
        fail 'Specify a service' unless service
        numbers.times { || puts service.generate }
    elsif mode == :validate
        usage unless ARGV.length > 0

        ARGV.each do |n|
            n = n.gsub(/\D/, '')
            puts "#{n} #{service.valid?(n)}"
        end
    elsif mode == :list_services
        services.each do |short, svc|
            puts "#{svc.name} (#{short})"
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
