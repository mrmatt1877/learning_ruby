require 'json'

class User
#accessing the variables passed in
  attr_accessor :email, :name, :permissions, :characteristics
#initializing the variables and passing them as arguments
  def initialize(*args)
    @email = args[0]
    @name = args[1]
    @permissions = User.permissions_from_template
    @characteristics = User.person
  end
#defining permissions_from_template by reading another document
  def self.permissions_from_template
    file = File.read 'user_permissions_template.json'
    JSON.load(file, nil, symbolize_names: true)
  end
#practicing by adding a person value
  def self.person
    file2 = File.read 'person.json'
    JSON.load(file2, nil, symbolize_names: true)
  end
#saving the data as json
  def save
    self_json = {email: @email, name: @name, permissions: @permissions, characteristics: @characteristics}.to_json
    open('users.json', 'a') do |file|
      file.puts self_json
    end
  end
end
