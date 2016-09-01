require 'pp'
require_relative 'user'

user = User.new 'bill@example.com', "Bill"

pp user

user.save
