#!/usr/bin/env perl
use strict;
use warnings;

my $parser = "http://yubnub.org/parser/parse?command=";
my $command = join "+", @ARGV;

print "Command: $command\n";

system "open ${parser}${command}";
