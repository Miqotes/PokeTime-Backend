class Team < ApplicationRecord
  belongs_to :user
  has_many :pokemon, through: :pokemonteams
end
