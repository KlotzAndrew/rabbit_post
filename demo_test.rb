#! /usr/bin/env ruby

sent = 0
received = 0

restarter = Thread.new do
  sleep 5
  puts 'restarting 1/3'
  `docker restart -t 1 rabbitpost_rabbit-1_1`

  sleep 5
  puts 'restarting 2/3'
  `docker restart -t 1 rabbitpost_rabbit-2_1`

  sleep 10
  puts 'restarting 3/3'
  `docker restart -t 1 rabbitpost_rabbit-3_1`
end

Dir.chdir('message_sender') { `rails runner Post.delete_all` }
Dir.chdir('message_consumer') { `rails runner Post.delete_all` }

Dir.chdir('message_sender') do
  sent = `rails runner 'puts Post.rain_for(30, 4)'`
end

Dir.chdir('message_consumer') do
  worker = Thread.new { `rake multiple_man:worker` }
  sleep 5 # process all messages
  worker.kill
  received = `rails runner 'puts Post.total'`
end

restarter.join

puts sent
puts received
