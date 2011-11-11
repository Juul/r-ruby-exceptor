#!/usr/bin/env ruby

require 'rubygems'
require 'rsruby'
require 'exceptor'

r = RSRuby.instance

r.source("test.r") # include the r test

begin

  puts Exceptor.call_r_func(r, r.foo, 3) # this will fail

rescue Exception => e
  if(e.message[:r_msg])
    puts "Error message from R: "
    puts " "
    puts e.message[:r_msg]
    puts " "
    puts "R backtrace:"
    puts " "
    puts e.message[:r_backtrace].join("\n")
    puts " "
  else
    puts "Error message from Ruby: "
    puts " "
    puts e.message
    puts " "
  end
  puts "Ruby backtrace: "
  puts " "
  puts e.backtrace.join("\n")
end
