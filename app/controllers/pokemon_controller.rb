class PokemonController < ApplicationController
    def index
        pokemon = Pokemon.all
        render json: pokemons, status: 200
      end
    
      def create
        pokemon = Pokemon.create(pokemon_params)
        render json: pokemon, status: 201
      end
    
      def update
        @pokemon.update(pokemon_params)
        render json: @pokemon, status: 200
      end
    
      def destroy
        pokemonId = @pokemon.id
        @pokemon.destroy
        render json: {message:"Pokemon removed", pokemonId:pokemonId}
      end
    
      def show
        render json: @pokemon, status: 200
      end
    
      private
      def pokemon_params
        params.permit()
      end
    
      def set_pokemon
        @pokemon = Pokemon.find(params[:id])
      end
end
