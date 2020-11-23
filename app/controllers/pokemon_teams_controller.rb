class PokemonTeamsController < ApplicationController
    def index
        pokemon_team = Pokemon_team.all
        render json: pokemon_teams, status: 200
      end
    
      def create
        pokemon_team = Pokemon_team.create(pokemon_team_params)
        render json: pokemon_team, status: 201
      end
    
      def update
        @pokemon_team.update(pokemon_team_params)
        render json: @pokemon_team, status: 200
      end
    
      def destroy
        pokemon_teamId = @pokemon_team.id
        @pokemon_team.destroy
        render json: {message:"Team removed", pokemon_teamId:pokemon_teamId}
      end
    
      def show
        render json: @pokemon_team, status: 200
      end
    
      private
      def pokemon_team_params
        params.permit()
      end
    
      def set_pokemon_team
        @pokemon_team = Pokemon_team.find(params[:id])
      end
end
