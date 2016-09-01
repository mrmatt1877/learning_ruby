phone_book = {
  "Winston Salem" => "336",
  "High Point" => "336",
  "Kernersville" => "336",
  "Thomasville" => "336",
  "Rural Hall" => "336",
  "Charlotte" => "704",
  "Imaginville" => "336",
  "Here" => "704",
  "Billyville" => "555",
  "Wonkaland" => "619",
}

def display_city(somehash)
  somehash.each { |k, v| puts k}
end
def display_area_code(somehash, key)
  somehash[key]
end

loop do
  puts "Do you want to look up a city name?(Y,N)?"

  answer = gets.chomp.capitalize
  if answer != "Y"
    break
  end
  puts "Pick a city."
  display_city(phone_book)
  puts "What is your city name?"
  city = gets.chomp.to_s
  if phone_book.key?(city)
    puts "The area code for #{city} is #{display_area_code(phone_book, city)}"
  else
    puts "This city is not recognized"
  end


end
