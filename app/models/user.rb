class User < ApplicationRecord
    has_secure_password

    has_many :favorites, through: :pokemon_favorites, class_name: Pokemon
    has_many :pokemon, through: :teams
end

# user id, pokemon id

