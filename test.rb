require 'sinatra'
require 'data_mapper'
require 'net/http'

DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, 'sqlite::memory:')

class Comment
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :comment, Text
  property :date, DateTime
end

DataMapper.finalize
DataMapper.auto_upgrade!

get '/' do
  "Web server OK"
end

raise "Database problem!" unless Comment.count == 0

puts
puts "Database OK"
puts
puts "Please visit the following address to check that the web server is OK"
puts
puts "  http://localhost:4567/"
puts
puts "Then quit by pressing Ctrl+C"
puts
