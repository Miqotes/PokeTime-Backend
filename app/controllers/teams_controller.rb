class TeamsController < ApplicationController
    def index
        team = Team.all
        render json: teams, status: 200
      end
    
      def create
        team = Team.create(team_params)
        render json: team, status: 201
      end
    
      def update
        @team.update(team_params)
        render json: @team, status: 200
      end
    
      def destroy
        teamId = @team.id
        @team.destroy
        render json: {message:"Team removed", teamId:teamId}
      end
    
      def show
        render json: @team, status: 200
      end
    
      private
      def team_params
        params.permit()
      end
    
      def set_team
        @team = Team.find(params[:id])
      end
end
