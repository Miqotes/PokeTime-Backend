class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :bio, :teams, :pokemon, :favorites

  def favorites
    object.favorites.map do |favorite_pokemons|
      PokemonSerializer.new(favorite_pokemons)
    end
  end

  def pokemon
    object.pokemon.map do |pokemon|
      PokemonSerializer.new(pokemon)
    end
  end

  def teams
    object.teams.map do |team|
      TeamSerializer.new(team)
    end
  end
end