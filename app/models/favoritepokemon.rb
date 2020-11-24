class Favoritepokemon < ApplicationRecord
  belongs_to :user
  belongs_to :pokemon
end
