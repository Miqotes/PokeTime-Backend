# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# fetching pokemon

require 'rest-client'

Pokemon.destroy_all

def pokemon
  response = RestClient.get 'https://pokeapi.co/api/v2/pokemon?limit=151'
  json_array = JSON.parse(response)['results']

  json_array.each do |pokedata|
    response = RestClient.get pokedata['url']
    full_pokemon = JSON.parse(response)

    Pokemon.create(
      name: pokedata['name'],
      url: pokedata['url'],
      sprite: full_pokemon['sprites']['front_default']
    )
  end
    
end

  # if !json.nil?
  #     json["data"].map do |pokedata|
  #         Pokemon.create(name: "#{pokedata["name"]}", img_url:"#{pokedata["url"]}")
  #     end
  # else
  #     puts "error seeding pokemon"
  # end


pokemon