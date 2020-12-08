class Team < ApplicationRecord
  belongs_to :user

  has_many :pokemonteams
  has_many :pokemon, through: :pokemonteams

  def name
    "not implemented"
  end
end
