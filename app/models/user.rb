class User < ApplicationRecord
    has_secure_password

    has_many :favoritepokemons
    has_many :favorites, through: :favoritepokemons, source: :pokemon

    has_many :teams
    has_many :pokemon, through: :teams

end

# user id, pokemon id
# user.pokemon.uniq
# user.teams
