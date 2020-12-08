class PokemonSerializer < ActiveModel::Serializer
    attributes :id, :name, :url, :sprite
end