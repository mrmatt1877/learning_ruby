require 'json'

class User
#accessing the variables passed in
  attr_accessor :email, :name, :permissions
#initializing the variables and passing them as arguments
  def initialize(*args)
    @email = args[0]
    @name = args[1]
    @permissions = User.permissions_from_template
  end
#defining permissions_from_template by reading another document
  def self.permissions_from_template
    file = File.read 'user_permissions_template.json'
    JSON.load(file, nil, symbolize_names: true)
  end
#saving the data as json
  def save
    self_json = {email: @email, name: @name, permissions: @permissions}.to_json
    open('users.json', 'a') do |file|
      file.puts self_json
    end
  end
end
