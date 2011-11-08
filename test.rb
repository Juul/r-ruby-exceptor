#!/usr/bin/env ruby

require 'rubygems'
require 'rsruby'
require 'exceptor'

r = RSRuby.instance

r.source("test.r") # include the r test

begin

  puts call_r_func(r, r.foo, 3) # this will fail

rescue Exception => e
  puts "Error message from R: "
  puts " "
  puts e.message[:r_msg]
  puts " "
  puts "R backtrace:"
  puts " "
  puts e.message[:r_backtrace]
  puts " "
  puts "Ruby backtrace: "
  puts " "
  puts e.backtrace.join("\n")
end
